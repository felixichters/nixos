{ config, pkgs, ... }:

{
  imports = [
		./home/shell/shell.nix
		./home/kitty/kitty.nix
		./home/vscode/vscode.nix
		./home/catppuccin/catppuccin.nix
		./home/sway/sway.nix
		#./home/gnome/gnome.nix
	];
	stylix.enable = true;
	stylix.image = ./bw.jpg;
	

	stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";

	home.username = "navi";
  	home.homeDirectory = "/home/navi";
  	home.stateVersion = "24.05";
  
  	programs.home-manager.enable = true;
	
	nixpkgs.config.allowUnfreePredicate = _: true;
}
