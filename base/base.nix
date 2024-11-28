{ config, pkgs, lib, ... }:

{
	imports = [
		./navi.nix 
		./networking.nix 
		./sound.nix
		./session.nix
		./hardware.nix
		./locales.nix
	];
	
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;	
	
	programs.zsh.enable = true;
	users.defaultUserShell = pkgs.zsh;
	
	programs.light.enable = true;
	
	programs.dconf.enable = true;
	
	programs.appimage.enable = true;	
	
	services.udisks2.enable = true;
	
	services.gvfs.enable = true;
	
	hardware.graphics.enable = true;
	
	security.pam.services.swaylock = {};
	
	virtualisation.libvirtd.enable = true;
	programs.virt-manager.enable = true;
	
	virtualisation.docker.enable = true;

	environment.systemPackages = with pkgs; [
		nasm
	];
}
