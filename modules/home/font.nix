{ pkgs, font, ... }:

{
  home.packages = [
    pkgs.${font.basePackage}
    pkgs.nerd-fonts.${font.nerdPackage}
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = ["IBM Plex Serif"];
      sansSerif = ["IBM Plex Sans"];
      monospace = [ font.name ];
    };
  };
}
