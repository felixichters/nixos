# Always-on baseline.
{
  system = { config, lib, pkgs, ... }: {
    imports = [ ../modules/system ];

    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelParams = [ "quiet" ];

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = lib.mkDefault "${pkgs.tuigreet}/bin/tuigreet --time --cmd sway";
          user = "greeter";
        };
      };
    };
  };

  home = { config, lib, pkgs, ... }: {
    imports = [ ../modules/home ];

    nixpkgs.config.allowUnfree = true;
    programs.home-manager.enable = true;
  };
}
