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
	home.username = "navi";
  home.homeDirectory = "/home/navi";
  home.stateVersion = "24.05";
  
  programs.home-manager.enable = true;
	
	nixpkgs.config.allowUnfreePredicate = _: true;
}
