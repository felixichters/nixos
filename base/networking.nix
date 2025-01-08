{ config, pkgs, lib, ... }:

{
	networking.hostName = "nixos"; 
	networking.networkmanager.enable = true;
	environment.systemPackages = with pkgs; [
		openconnect
		openvpn
	];
}
