{ config, pkgs, ... }:

{
  imports = [
		./home/shell/shell.nix
		./home/kitty/kitty.nix
		./home/vscode/vscode.nix
		./home/sway/sway.nix
		./home/stylix/stylix.nix
		./home/git/git.nix
		./home/waybar/waybar.nix
		./home/apps.nix
	];

	home.username = "navi";
  home.homeDirectory = "/home/navi";
  home.stateVersion = "24.05";
  
  programs.home-manager.enable = true;
	
	nixpkgs.config.allowUnfreePredicate = _: true;
}
