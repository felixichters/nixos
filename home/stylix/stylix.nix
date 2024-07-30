{ config, pkgs, lib, ... }:

{
  stylix = {
    enable = true;
	  image = ./vibe.jpg;
		#base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
		#base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
		#base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-dark.yaml";
    base16Scheme = {	
			base00 = "101010"; #  ----
			base01 = "2a2a2a"; #  ---
			base02 = "444444"; #  --
			base03 = "555555"; #  -
			base04 = "aaaaaa"; #  +
			base05 = "cccccc"; #  ++
			base06 = "dddddd"; #  +++
			base07 = "deeeed"; #  ++++
			base08 = "d70000"; # red 
			base09 = "ffaa88"; # orange
			base0A = "ffaa88"; # yellow 
			base0B = "789978"; # green
			base0C = "7788aa"; # cyan
			base0D = "708090"; # blue 
			base0E = "789978"; #purple 
			base0F = "7788aa"; #brown
		};
    #targets.vscode.enable = false;
    targets.vim.enable = false;

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
