{ config, pkgs,... }:

{
  imports = [
		./home/core/core.nix
		./home/tools/tools.nix 
		./home/apps/apps.nix
	];
	
	sway.enable = true;
	home.username = "navi";
  home.homeDirectory = "/home/navi";
  home.stateVersion = "24.05";
  
	programs.home-manager.enable = true;
	
	nixpkgs.config.allowUnfreePredicate = _: true;
}
