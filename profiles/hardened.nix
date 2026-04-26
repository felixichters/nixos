# Hardened specialisation. Built into every system that lists
# this profile. Switch into it at the boot menu or at runtime:
#
#   sudo /run/current-system/specialisation/hardened/bin/switch-to-configuration switch
#
# Switch back to the default config:
#
#   sudo /run/booted-system/bin/switch-to-configuration switch
#
# Note: standalone Home Manager does not ride along with NixOS specialisations,
# so the user-level config (chromium, vscode, etc.) stays the same in both
# modes. Tor Browser and Librewolf are installed system-wide so they are
# available without touching home.
{
  system = { config, lib, pkgs, ... }: {
    specialisation.hardened.configuration = {
      system.nixos.tags = [ "hardened" ];

      # Network lockdown
      # Mullvad daemon ships its own kill-switch; enable lockdown-mode at
      # runtime with `mullvad lockdown-mode set on` after `mullvad account login`.
      services.mullvad-vpn = {
        enable = true;
        package = pkgs.mullvad-vpn;
      };

      # Encrypted DNS via systemd-resolved (DoT to Mullvad's resolvers).
      services.resolved = {
        enable = true;
        settings.Resolve = {
          DNSSEC = "true";
          DNSOverTLS = "true";
          FallbackDNS = [ "194.242.2.2" "2a07:e340::2" ];
        };
      };
      networking.nameservers = lib.mkForce [ "194.242.2.2" "2a07:e340::2" ];

      # Disable IPv6 globally to avoid leaks outside the VPN tunnel.
      networking.enableIPv6 = lib.mkForce false;

      # Hardware + kernel lockdown
      # linuxPackages_hardened was removed from nixpkgs; latest kernel + the
      # sysctl lockdown below provides the practical equivalent.
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

      # App sandboxing + privacy browsers
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

      # Privacy: no persistence, no history
      services.journald.extraConfig = ''
        Storage=volatile
        RuntimeMaxUse=64M
      '';

      # System-wide zsh: no history file.
      programs.zsh.histFile = lib.mkForce "/dev/null";

      # No thumbnail cache, no auto-mount of removable media.
      services.gvfs.enable = lib.mkForce false;
    };
  };
}
