{ config, pkgs, ... }:

{
	
	imports = [ 
		./hardware-configuration.nix
		./system/system.nix
	];
	hardware.graphics.enable = true;
	nixpkgs.config.allowUnfree = true;
	system.stateVersion = "23.11";
	nix.settings.experimental-features = ["nix-command" "flakes"];
	programs.dconf.enable = true;
}
