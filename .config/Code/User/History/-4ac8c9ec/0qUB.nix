{ config, pkgs, lib, ... }:

{
  stylix = {
    enable = true;
	  image = ./land.jpg;
	  base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-dark.yaml";
    
    #targets.vscode.enable = false;
    targets.nvim.enable = false;

    cursor = {
      package = pkgs.apple-cursor;
      name = "macOS-BigSur";
      size = 25;
    };
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