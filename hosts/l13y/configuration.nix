{ config, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
		../../modules/system/system.nix
	];
	
	nixpkgs.config.allowUnfree = true;
	system.stateVersion = "23.11";
	nix.settings.experimental-features = ["nix-command" "flakes"];
}
