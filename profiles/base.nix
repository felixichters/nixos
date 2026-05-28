{
  system = { config, lib, pkgs, ... }: {
    imports = [ ../modules/system ];

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
  };

  home = { config, lib, pkgs, ... }: {
    imports = [ ../modules/home ];

    nixpkgs.config.allowUnfree = true;
    programs.home-manager.enable = true;

    credentials.enable = lib.mkDefault true;
    nettools.enable = lib.mkDefault true;
  };
}
