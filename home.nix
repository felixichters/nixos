{ config, pkgs,... }:

{
  imports = [
		./home/browser/browser.nix
		./home/editor/editor.nix
		./home/git/git.nix
		./home/session/session.nix
		./home/shell/shell.nix
		./home/theme/theme.nix
		./home/dev/dev.nix
		./home/font.nix
	];
	
	lackluster.enable = true;

	fonts.fontconfig.enable = true;
	
	home.username = "navi";
  home.homeDirectory = "/home/navi";
  home.stateVersion = "24.05";
  
	programs.home-manager.enable = true;
	
	nixpkgs.config.allowUnfreePredicate = _: true;
}
