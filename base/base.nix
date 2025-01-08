{ config, pkgs, lib, ... }:

{
	imports = [
		./user.nix 
		./networking.nix 
		./sound.nix
		./session.nix
		./performance.nix
		./locales.nix
		./system-extra.nix
	];
	
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;	
	
	hardware.bluetooth.enable = true;
	hardware.bluetooth.powerOnBoot = true;
	services.blueman.enable = true;

	programs.light.enable = true;
	
	programs.dconf.enable = true;
	
	programs.appimage.enable = true;	
	
	services.udisks2.enable = true;
	
	services.gvfs.enable = true;
	
	
	security.pam.services.swaylock = {};
	

}
