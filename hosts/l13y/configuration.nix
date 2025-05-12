{ config, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
		./boot.nix
		../../modules/system/system.nix
	];
	gaming.enable = true;
	nixpkgs.config.allowUnfree = true;
	system.stateVersion = "24.11";
	nix.settings.experimental-features = ["nix-command" "flakes"];
}
