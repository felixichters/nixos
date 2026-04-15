{ config, lib, pkgs, theme, font, ... }:
{
  options.wmenu = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "enable wmenu";
    };
    menuCommand = lib.mkOption {
      type = lib.types.str;
      default = let
        nb = lib.removePrefix "#" theme.wmenu.normalBg;
        nf = lib.removePrefix "#" theme.wmenu.normalFg;
        sb = lib.removePrefix "#" theme.wmenu.selectedBg;
        sf = lib.removePrefix "#" theme.wmenu.selectedFg;
      in "wmenu-run -N ${nb} -n ${nf} -S ${sb} -s ${sf} -f '${font.name} 12'";
    };
  };

  config = lib.mkIf config.wmenu.enable {
    home.packages = [ pkgs.wmenu ];
  };
}
