{ config, lib, theme, font, ... }:

{
  options.foot.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable foot";
  };

  config = lib.mkIf config.foot.enable {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          font = "${font.name}:size=11";
          pad  = "8x8";
        };
        #cursor = {
        #  style = "block";
        #  blink = "no";
        #};
        mouse = {
          hide-when-typing = "yes";
        };
        colors-dark = let
          c = s: lib.removePrefix "#" s;
        in {
          background           = c theme.foot.background;
          foreground           = c theme.foot.foreground;
          selection-foreground = c theme.foot.selectionForeground;
          selection-background = c theme.foot.selectionBackground;
          regular0 = c theme.foot.color00;
          regular1 = c theme.foot.color01;
          regular2 = c theme.foot.color02;
          regular3 = c theme.foot.color03;
          regular4 = c theme.foot.color04;
          regular5 = c theme.foot.color05;
          regular6 = c theme.foot.color06;
          regular7 = c theme.foot.color07;
          bright0  = c theme.foot.color08;
          bright1  = c theme.foot.color09;
          bright2  = c theme.foot.color10;
          bright3  = c theme.foot.color11;
          bright4  = c theme.foot.color12;
          bright5  = c theme.foot.color13;
          bright6  = c theme.foot.color14;
          bright7  = c theme.foot.color15;
        };
      };
    };
  };
}
