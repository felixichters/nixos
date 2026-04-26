{
  system = { config, lib, pkgs, ... }: {
    specialisation.hardened.configuration = {
      system.nixos.tags = [ "hardened" ];

      services.mullvad-vpn = {
        enable = true;
        package = pkgs.mullvad-vpn;
      };

      services.resolved = {
        enable = true;
        settings.Resolve = {
          DNSSEC = "true";
          DNSOverTLS = "true";
          FallbackDNS = [ "194.242.2.2" "2a07:e340::2" ];
        };
      };
      networking.nameservers = lib.mkForce [ "194.242.2.2" "2a07:e340::2" ];

      networking.enableIPv6 = lib.mkForce false;

      boot.kernelPackages = lib.mkForce pkgs.linuxPackages_latest;
      boot.blacklistedKernelModules = [
        "uvcvideo"   # built-in webcams
        "btusb"      # bluetooth USB
      ];
      boot.kernel.sysctl = {
        "kernel.kptr_restrict" = 2;
        "kernel.dmesg_restrict" = 1;
        "kernel.yama.ptrace_scope" = 2;
        "kernel.unprivileged_bpf_disabled" = 1;
        "net.core.bpf_jit_harden" = 2;
        "net.ipv4.conf.all.rp_filter" = 1;
        "net.ipv4.conf.default.rp_filter" = 1;
        "net.ipv4.conf.all.send_redirects" = 0;
        "net.ipv4.conf.all.accept_redirects" = 0;
        "net.ipv4.conf.all.accept_source_route" = 0;
      };

      hardware.bluetooth.enable = lib.mkForce false;
      services.blueman.enable = lib.mkForce false;

      security.apparmor = {
        enable = true;
        killUnconfinedConfinables = true;
      };

      programs.firejail.enable = true;

      environment.systemPackages = with pkgs; [
        tor-browser
        librewolf
        mullvad-vpn
      ];

      services.journald.extraConfig = ''
        Storage=volatile
        RuntimeMaxUse=64M
      '';

      programs.zsh.histFile = lib.mkForce "/dev/null";

      services.gvfs.enable = lib.mkForce false;
    };
  };
}
