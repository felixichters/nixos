{ lib, pkgs, ... }:
{
  imports = [
    ./user.nix
    ./networking.nix
    ./sound.nix
    ./locales.nix
    ./virtualization.nix
    ./graphics.nix
    ./compat.nix
    ./dns.nix
    ./filesystems.nix
    ./swaylock.nix
    ./wireshark.nix
    ./hardening.nix
    ./flatpak.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "quiet" "systemd.show-status=1" "udev.log_level=3" ];

  boot.tmp.useTmpfs = true;
  boot.tmp.cleanOnBoot = true;

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };

  services.getty.autologinUser = lib.mkDefault "felix";
  
  documentation.enable = true;
  documentation.man.enable = true;
  documentation.dev.enable = true;

  environment.systemPackages = with pkgs; [
    man-pages
    man-pages-posix
  ];
}
