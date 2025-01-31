{ config, pkgs, lib, ... }:

{
	networking.hostName = "nixos"; 
	networking.networkmanager.enable = true;
	networking.firewall = { 
		enable = true;
		allowedTCPPorts = [12345];
	};
}
