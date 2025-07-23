{ user, pkgs, ... }:

{
  imports = [
		../../modules/home/core/core.nix
		../../modules/home/tools/tools.nix 
		../../modules/home/apps/apps.nix
		./extra.nix
	];
	
	home.username = user;
	home.homeDirectory = "/home/${user}";
	home.stateVersion = "24.05";
	foot.enable = true;  
	programs.home-manager.enable = true;
	nixpkgs.config.allowUnfree = true;
}
