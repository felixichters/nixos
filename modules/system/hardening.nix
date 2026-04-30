{ config, lib, ... }:
{
  options.hardening.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "kernel/network hardening";
  };

  config = lib.mkIf config.hardening.enable {
    security.sudo.extraConfig = ''
      Defaults timestamp_timeout=30
    '';
    networking.firewall.enable = true;
    security.polkit.enable = true;

    boot.kernelParams = [
      "init_on_alloc=1"
      "init_on_free=1"
      "page_alloc.shuffle=1"
      "slab_nomerge"
      "randomize_kstack_offset=on"
      "vsyscall=none"
      "debugfs=off"
    ];

    boot.kernel.sysctl = {
      "kernel.kptr_restrict" = 2;
      "kernel.dmesg_restrict" = 1;
      "kernel.printk" = "3 3 3 3";
      "kernel.perf_event_paranoid" = 3;

      "kernel.unprivileged_bpf_disabled" = 1;
      "net.core.bpf_jit_harden" = 2;
      "kernel.kexec_load_disabled" = 1;
      "kernel.sysrq" = 4;
      "kernel.yama.ptrace_scope" = 1;

      "fs.protected_hardlinks" = 1;
      "fs.protected_symlinks" = 1;
      "fs.protected_fifos" = 2;
      "fs.protected_regular" = 2;
      "fs.suid_dumpable" = 0;

      "net.ipv4.conf.all.rp_filter" = 1;
      "net.ipv4.conf.default.rp_filter" = 1;
      "net.ipv4.tcp_syncookies" = 1;
      "net.ipv4.conf.all.accept_redirects" = 0;
      "net.ipv4.conf.default.accept_redirects" = 0;
      "net.ipv4.conf.all.send_redirects" = 0;
      "net.ipv4.conf.default.send_redirects" = 0;
      "net.ipv4.conf.all.accept_source_route" = 0;
      "net.ipv4.conf.default.accept_source_route" = 0;
      "net.ipv6.conf.all.accept_redirects" = 0;
      "net.ipv6.conf.default.accept_redirects" = 0;
      "net.ipv6.conf.all.accept_source_route" = 0;
      "net.ipv6.conf.default.accept_source_route" = 0;
      "net.ipv4.icmp_echo_ignore_broadcasts" = 1;
      "net.ipv4.conf.all.log_martians" = 1;
    };

    systemd.coredump.extraConfig = ''
      Storage=none
      ProcessSizeMax=0
    '';

    services.journald.extraConfig = ''
      SystemMaxUse=200M
      MaxRetentionSec=1month
    '';
  };
}
