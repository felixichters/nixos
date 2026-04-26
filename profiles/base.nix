# Always-on baseline. Imports the entire module tree so that any other profile
# can flip the option flags those modules expose. Boot loader + greetd live
# here so that hardware profiles (e.g. nvidia) only need to override the
# greetd command via mkForce.
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
