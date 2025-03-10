{ config, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
		./boot.nix
		../../modules/system/system.nix
	];
	options.gaming.enable = true;
	nixpkgs.config.allowUnfree = true;
	system.stateVersion = "23.11";
	nix.settings.experimental-features = ["nix-command" "flakes"];
}
