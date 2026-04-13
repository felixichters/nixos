#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <dirent.h>
#include <sys/statvfs.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <net/if.h>
#include <linux/wireless.h>
#include <arpa/inet.h>
#include <netinet/in.h>

#define INTERVAL_BATTERY 30
#define INTERVAL_STORAGE 30
#define INTERVAL_RAM      5
#define INTERVAL_CPU      2
#define INTERVAL_NET      5

typedef struct {
    char clock_str[8];   /* "14:30"     */
    char date_str[12];   /* "10/04/2026" */
    char bat_str[16];    /* "BAT: +87%"  or "" if no battery */
    char cpu_str[24];    /* "CPU: 0.42/8"       */
    char ram_str[24];    /* "RAM: 3.2G/31.2G"  */
    char stor_str[24];   /* "/: 45.1G/512.0G"  */
    char net_str[64];    /* "[W: SSID | 192.168.1.5]" / "[E: 10.0.0.2]" / "[!]" */
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
    int ok = fscanf(f, "%f", &load) == 1;
    fclose(f);

    long cores = sysconf(_SC_NPROCESSORS_ONLN);
    if (ok && cores > 0)
        snprintf(s->cpu_str, sizeof(s->cpu_str), "CPU: %.2f/%ld", load, cores);
    else if (ok)
        snprintf(s->cpu_str, sizeof(s->cpu_str), "CPU: %.2f", load);
    else
        snprintf(s->cpu_str, sizeof(s->cpu_str), "CPU: ?");
}

static void update_ram(State *s)
{
    mono_now(&s->last_ram);

    FILE *f = fopen("/proc/meminfo", "r");
    if (!f) { snprintf(s->ram_str, sizeof(s->ram_str), "RAM: ?"); return; }

    char line[128];
    long total_kb = -1, avail_kb = -1;
    while (fgets(line, sizeof(line), f)) {
        if (strncmp(line, "MemTotal:", 9) == 0)
            sscanf(line + 9, "%ld", &total_kb);
        else if (strncmp(line, "MemAvailable:", 13) == 0)
            sscanf(line + 13, "%ld", &avail_kb);
        if (total_kb >= 0 && avail_kb >= 0) break;
    }
    fclose(f);

    if (total_kb < 0 || avail_kb < 0)
        snprintf(s->ram_str, sizeof(s->ram_str), "RAM: ?");
    else {
        long used_kb = total_kb - avail_kb;
        snprintf(s->ram_str, sizeof(s->ram_str), "RAM: %.1fG/%.1fG",
                 used_kb   / (1024.0 * 1024.0),
                 total_kb  / (1024.0 * 1024.0));
    }
}

static void update_storage(State *s)
{
    mono_now(&s->last_storage);

    struct statvfs st;
    if (statvfs("/", &st) != 0) {
        snprintf(s->stor_str, sizeof(s->stor_str), "/: ?");
        return;
    }

    unsigned long long total = (unsigned long long)st.f_blocks * st.f_frsize;
    unsigned long long used  = (unsigned long long)(st.f_blocks - st.f_bfree) * st.f_frsize;
    snprintf(s->stor_str, sizeof(s->stor_str), "/: %.1fG/%.1fG",
             used  / (1024.0 * 1024.0 * 1024.0),
             total / (1024.0 * 1024.0 * 1024.0));
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

    /* Find active interface — prefer wifi over ethernet */
    char active_iface[IFNAMSIZ] = "";
    int active_is_wifi = 0;

    DIR *d = opendir("/sys/class/net");
    if (!d) { snprintf(s->net_str, sizeof(s->net_str), "[!]"); return; }

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

        int wifi = is_wireless(name);
        if (active_iface[0] == '\0' || wifi) {
            strncpy(active_iface, name, IFNAMSIZ - 1);
            active_iface[IFNAMSIZ - 1] = '\0';
            active_is_wifi = wifi;
            if (wifi) break; /* wifi takes priority */
        }
    }
    closedir(d);

    if (active_iface[0] == '\0') {
        snprintf(s->net_str, sizeof(s->net_str), "[!]");
        return;
    }

    /* Get IP and (for wifi) SSID via ioctls */
    char ip_str[INET_ADDRSTRLEN] = "?";
    int sock = socket(AF_INET, SOCK_DGRAM, 0);
    if (sock >= 0) {
        struct ifreq ifr;
        memset(&ifr, 0, sizeof(ifr));
        strncpy(ifr.ifr_name, active_iface, IFNAMSIZ - 1);
        if (ioctl(sock, SIOCGIFADDR, &ifr) == 0)
            inet_ntop(AF_INET,
                      &((struct sockaddr_in *)&ifr.ifr_addr)->sin_addr,
                      ip_str, sizeof(ip_str));

        if (active_is_wifi) {
            struct iwreq wreq;
            char ssid[IW_ESSID_MAX_SIZE + 1] = "";
            memset(&wreq, 0, sizeof(wreq));
            strncpy(wreq.ifr_name, active_iface, IFNAMSIZ - 1);
            wreq.u.essid.pointer = ssid;
            wreq.u.essid.length  = IW_ESSID_MAX_SIZE;
            if (ioctl(sock, SIOCGIWESSID, &wreq) == 0 && ssid[0])
                snprintf(s->net_str, sizeof(s->net_str), "[W: %s@%s]", ip_str, ssid);
            else
                snprintf(s->net_str, sizeof(s->net_str), "[W: %s]", ip_str);
        } else {
            snprintf(s->net_str, sizeof(s->net_str), "[E: %s]", ip_str);
        }
        close(sock);
    } else {
        snprintf(s->net_str, sizeof(s->net_str), active_is_wifi ? "[W]" : "[E]");
    }
}

/* ── output ──────────────────────────────────────────────────────────────── */

static void print_status(const State *s)
{
    char prefix[96] = "";
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
