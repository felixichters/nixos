{ config, pkgs, lib, ... }:

{
  fonts.fontconfig.enable = true;
  stylix = {
  enable = true;
	image = ./land.jpg;
	#base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
  #base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
  base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-dark.yaml";
  cursor.package = pkgs.apple-cursor;
  cursor.name = "macOS-BigSur";
    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sizes = {
        applications = 11;
        desktop = 9;
        terminal = 11;
      };
    }; 
    opacity = {
      applications = 1.0;
      terminal = 1.0;
      desktop = 1.0;
    };
  };
}