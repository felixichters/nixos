#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <dirent.h>
#include <sys/statvfs.h>

#define INTERVAL_BATTERY 30
#define INTERVAL_STORAGE 30
#define INTERVAL_RAM      5
#define INTERVAL_CPU      2
#define INTERVAL_NET      5

typedef struct {
    char clock_str[8];   /* "14:30"     */
    char date_str[12];   /* "10/04/2026" */
    char bat_str[16];    /* "BAT: +87%"  or "" if no battery */
    char cpu_str[16];    /* "CPU: 0.42"  */
    char ram_str[16];    /* "RAM: 3.2G"  */
    char stor_str[16];   /* "/: 45%"     */
    char net_str[8];     /* "[W]" / "[E]" / "[!]" */
    char vpn_str[8];     /* "[VPN]" or "" */
    char ssh_str[8];     /* "[SSH]" or "" */

    struct timespec last_battery;
    struct timespec last_storage;
    struct timespec last_ram;
    struct timespec last_cpu;
    struct timespec last_net;
    time_t next_clock;
} State;

/* ── helpers ─────────────────────────────────────────────────────────────── */

static void mono_now(struct timespec *ts)
{
    clock_gettime(CLOCK_MONOTONIC, ts);
}

static long elapsed_sec(const struct timespec *last)
{
    struct timespec now;
    mono_now(&now);
    return now.tv_sec - last->tv_sec;
}

static int read_str(const char *path, char *buf, int len)
{
    FILE *f = fopen(path, "r");
    if (!f) return 0;
    int ok = fgets(buf, len, f) != NULL;
    fclose(f);
    int l = strlen(buf);
    if (l > 0 && buf[l - 1] == '\n') buf[l - 1] = '\0';
    return ok;
}

static int min2(int a, int b) { return a < b ? a : b; }

/* ── updaters ─────────────────────────────────────────────────────────────── */

static void update_clock(State *s)
{
    time_t t = time(NULL);
    struct tm *tm_info = localtime(&t);
    strftime(s->clock_str, sizeof(s->clock_str), "%H:%M", tm_info);
    strftime(s->date_str,  sizeof(s->date_str),  "%d/%m/%Y", tm_info);
    s->next_clock = t + (60 - tm_info->tm_sec);
}

static void update_battery(State *s)
{
    mono_now(&s->last_battery);

    const char *bases[] = {
        "/sys/class/power_supply/BAT0",
        "/sys/class/power_supply/BAT1",
        NULL
    };

    for (int i = 0; bases[i]; i++) {
        char cap_path[64], stat_path[64];
        snprintf(cap_path,  sizeof(cap_path),  "%s/capacity", bases[i]);
        snprintf(stat_path, sizeof(stat_path), "%s/status",   bases[i]);

        FILE *f = fopen(cap_path, "r");
        if (!f) continue;

        int cap;
        if (fscanf(f, "%d", &cap) != 1) { fclose(f); continue; }
        fclose(f);

        char status[16] = "";
        read_str(stat_path, status, sizeof(status));

        char sign = (strncmp(status, "Charging", 8) == 0) ? '+' : '-';
        snprintf(s->bat_str, sizeof(s->bat_str), "BAT: %c%d%%", sign, cap);
        return;
    }

    s->bat_str[0] = '\0';
}

static void update_cpu(State *s)
{
    mono_now(&s->last_cpu);

    FILE *f = fopen("/proc/loadavg", "r");
    if (!f) { snprintf(s->cpu_str, sizeof(s->cpu_str), "CPU: ?"); return; }

    float load;
    if (fscanf(f, "%f", &load) == 1)
        snprintf(s->cpu_str, sizeof(s->cpu_str), "CPU: %.2f", load);
    else
        snprintf(s->cpu_str, sizeof(s->cpu_str), "CPU: ?");
    fclose(f);
}

static void update_ram(State *s)
{
    mono_now(&s->last_ram);

    FILE *f = fopen("/proc/meminfo", "r");
    if (!f) { snprintf(s->ram_str, sizeof(s->ram_str), "RAM: ?"); return; }

    char line[128];
    long avail_kb = -1;
    while (fgets(line, sizeof(line), f)) {
        if (strncmp(line, "MemAvailable:", 13) == 0) {
            sscanf(line + 13, "%ld", &avail_kb);
            break;
        }
    }
    fclose(f);

    if (avail_kb < 0)
        snprintf(s->ram_str, sizeof(s->ram_str), "RAM: ?");
    else
        snprintf(s->ram_str, sizeof(s->ram_str), "RAM: %.1fG",
                 avail_kb / (1024.0 * 1024.0));
}

static void update_storage(State *s)
{
    mono_now(&s->last_storage);

    struct statvfs st;
    if (statvfs("/", &st) != 0) {
        snprintf(s->stor_str, sizeof(s->stor_str), "/: ?");
        return;
    }

    unsigned long used = st.f_blocks - st.f_bfree;
    int pct = (int)(100UL * used / st.f_blocks);
    snprintf(s->stor_str, sizeof(s->stor_str), "/: %d%%", pct);
}

static int is_wireless(const char *iface)
{
    char path[64];
    snprintf(path, sizeof(path), "/sys/class/net/%s/wireless", iface);
    DIR *d = opendir(path);
    if (d) { closedir(d); return 1; }
    return 0;
}

static void update_network(State *s)
{
    mono_now(&s->last_net);

    /* VPN: look for an up tun interface */
    char operstate[16];
    if (read_str("/sys/class/net/tun0/operstate", operstate, sizeof(operstate))
            && strncmp(operstate, "up", 2) == 0)
        snprintf(s->vpn_str, sizeof(s->vpn_str), "[VPN]");
    else
        s->vpn_str[0] = '\0';

    /* SSH: scan /proc/net/tcp for established connections on port 22 */
    s->ssh_str[0] = '\0';
    FILE *f = fopen("/proc/net/tcp", "r");
    if (f) {
        char line[256];
        fgets(line, sizeof(line), f); /* skip header */
        while (fgets(line, sizeof(line), f)) {
            char local[32], remote[32], state[4];
            /* fields: sl: local remote state ... */
            if (sscanf(line, " %*s %31s %31s %3s", local, remote, state) != 3)
                continue;
            if (strcmp(state, "01") != 0) continue;
            char *lport = strchr(local,  ':');
            char *rport = strchr(remote, ':');
            if ((lport && strcmp(lport + 1, "0016") == 0) ||
                (rport && strcmp(rport + 1, "0016") == 0)) {
                snprintf(s->ssh_str, sizeof(s->ssh_str), "[SSH]");
                break;
            }
        }
        fclose(f);
    }

    /* Network type: scan /sys/class/net/ for the first up interface */
    DIR *d = opendir("/sys/class/net");
    if (!d) { snprintf(s->net_str, sizeof(s->net_str), "[!]"); return; }

    int found_wifi = 0, found_eth = 0;
    struct dirent *ent;
    while ((ent = readdir(d)) != NULL) {
        const char *name = ent->d_name;
        if (name[0] == '.') continue;
        if (strcmp(name, "lo") == 0) continue;
        if (strncmp(name, "tun", 3) == 0) continue;

        char op_path[64];
        snprintf(op_path, sizeof(op_path), "/sys/class/net/%s/operstate", name);
        if (!read_str(op_path, operstate, sizeof(operstate))) continue;
        if (strncmp(operstate, "up", 2) != 0) continue;

        if (is_wireless(name))
            found_wifi = 1;
        else
            found_eth = 1;
    }
    closedir(d);

    if (found_wifi)       snprintf(s->net_str, sizeof(s->net_str), "[W]");
    else if (found_eth)   snprintf(s->net_str, sizeof(s->net_str), "[E]");
    else                  snprintf(s->net_str, sizeof(s->net_str), "[!]");
}

/* ── output ──────────────────────────────────────────────────────────────── */

static void print_status(const State *s)
{
    char prefix[32] = "";
    if (s->vpn_str[0]) { strcat(prefix, s->vpn_str); strcat(prefix, " "); }
    if (s->ssh_str[0]) { strcat(prefix, s->ssh_str); strcat(prefix, " "); }
    strcat(prefix, s->net_str);

    if (s->bat_str[0])
        printf("%s | %s | %s | %s | %s | %s %s\n",
               prefix, s->stor_str, s->ram_str, s->cpu_str,
               s->bat_str, s->date_str, s->clock_str);
    else
        printf("%s | %s | %s | %s | %s %s\n",
               prefix, s->stor_str, s->ram_str, s->cpu_str,
               s->date_str, s->clock_str);

    fflush(stdout);
}

/* ── main loop ───────────────────────────────────────────────────────────── */

int main(void)
{
    State s = {0};

    update_clock(&s);
    update_battery(&s);
    update_cpu(&s);
    update_ram(&s);
    update_storage(&s);
    update_network(&s);
    print_status(&s);

    while (1) {
        time_t now_wall = time(NULL);
        int clock_secs = (int)(s.next_clock - now_wall);
        if (clock_secs < 1) clock_secs = 1;

        int bat  = (int)(INTERVAL_BATTERY - elapsed_sec(&s.last_battery));
        int stor = (int)(INTERVAL_STORAGE  - elapsed_sec(&s.last_storage));
        int ram  = (int)(INTERVAL_RAM      - elapsed_sec(&s.last_ram));
        int cpu  = (int)(INTERVAL_CPU      - elapsed_sec(&s.last_cpu));
        int net  = (int)(INTERVAL_NET      - elapsed_sec(&s.last_net));

        int secs = clock_secs;
        secs = min2(secs, bat  > 0 ? bat  : 1);
        secs = min2(secs, stor > 0 ? stor : 1);
        secs = min2(secs, ram  > 0 ? ram  : 1);
        secs = min2(secs, cpu  > 0 ? cpu  : 1);
        secs = min2(secs, net  > 0 ? net  : 1);

        sleep(secs);

        now_wall = time(NULL);
        struct timespec now_mono;
        mono_now(&now_mono);

        int updated = 0;

#define DUE(last, interval) (now_mono.tv_sec - (last).tv_sec >= (interval))

        if (now_wall >= s.next_clock)          { update_clock(&s);   updated = 1; }
        if (DUE(s.last_battery, INTERVAL_BATTERY)) { update_battery(&s); updated = 1; }
        if (DUE(s.last_storage, INTERVAL_STORAGE)) { update_storage(&s); updated = 1; }
        if (DUE(s.last_ram,     INTERVAL_RAM))     { update_ram(&s);     updated = 1; }
        if (DUE(s.last_cpu,     INTERVAL_CPU))     { update_cpu(&s);     updated = 1; }
        if (DUE(s.last_net,     INTERVAL_NET))     { update_network(&s); updated = 1; }

#undef DUE

        if (updated) print_status(&s);
    }

    return 0;
}
