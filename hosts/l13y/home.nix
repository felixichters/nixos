{ user, pkgs, ... }:

{
  imports = [
		../../modules/home/core/core.nix
		../../modules/home/tools/tools.nix 
		../../modules/home/apps/apps.nix
	];
	
	home.username = user;
	home.homeDirectory = "/home/${user}";
	home.stateVersion = "24.05";
  
	programs.home-manager.enable = true;
	nixpkgs.config.allowUnfree = true;
	home.packages = with pkgs; [
		(katago.override {
			backend = "eigen";
			enableAVX2 = true;
		})
	];
}
