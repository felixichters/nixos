{ config, pkgs, lib, ... }:

{

	imports = [
		./navi.nix 
		./networking.nix 
		./sound.nix
		./fonts.nix
		./packages.nix
	];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	programs.dconf.enable = true;
	hardware.graphics.enable = true;
	security.pam.services.swaylock = {};
	time.timeZone = "Europe/Berlin";

	i18n.defaultLocale = "en_US.UTF-8";

	services.xserver = {
		xkb.layout = "de";
		xkb.variant = "";
	};

	console.keyMap = "de";

}
