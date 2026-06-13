{ lib, pkgs, theme, font, ... }:
{
  options.wmenu.menuCommand = lib.mkOption {
    type = lib.types.str;
    default = let
      nb = lib.removePrefix "#" theme.wmenu.normalBg;
      nf = lib.removePrefix "#" theme.wmenu.normalFg;
      sb = lib.removePrefix "#" theme.wmenu.selectedBg;
      sf = lib.removePrefix "#" theme.wmenu.selectedFg;
    in "wmenu-run -N ${nb} -n ${nf} -S ${sb} -s ${sf} -f '${font.name} 12'";
  };

  config = {
    home.packages = [ pkgs.wmenu ];
  };
}
