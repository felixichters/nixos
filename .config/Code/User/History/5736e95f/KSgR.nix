{ config, pkgs, ... }:

{
	
	imports = [ 
		./hardware-configuration.nix
		./system/system.nix
	];
	stylix.enable = true;
	nixpkgs.config.allowUnfree = true;
	system.stateVersion = "23.11";
	nix.settings.experimental-features = ["nix-command" "flakes"];
}
