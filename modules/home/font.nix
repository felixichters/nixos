{ config, lib, pkgs, font, ... }:
{
  options.fonts.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "install system font + fontconfig defaults";
  };

  config = lib.mkIf config.fonts.enable {
    home.packages = [
      pkgs.${font.basePackage}
      pkgs.nerd-fonts.${font.nerdPackage}
    ];
    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "IBM Plex Serif" ];
        sansSerif = [ "IBM Plex Sans" ];
        monospace = [ font.name ];
      };
    };
  };
}
