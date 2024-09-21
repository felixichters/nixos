{ config, pkgs,... }:

{
  imports = [
		./home/shell/shell.nix
		./home/kitty/kitty.nix
		./home/vscode/vscode.nix
		./home/sway/sway.nix
		./home/theme/theme.nix
		./home/git/git.nix
		./home/waybar/waybar.nix
		./home/firefox/firefox.nix
		./home/ranger/ranger.nix
		./home/apps.nix
		./home/hyprland/hyprland.nix
		./home/mako/mako.nix
		./home/nvim/nvim.nix
		#./home/networks.nix
	];
	
	fonts.fontconfig.enable = true;
	
	home.username = "navi";
  home.homeDirectory = "/home/navi";
  home.stateVersion = "24.05";
  
	programs.home-manager.enable = true;
	
	nixpkgs.config.allowUnfreePredicate = _: true;
}
