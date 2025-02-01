{ config, pkgs, lib, ... }:

{
	networking.hostName = "l13y"; 
	networking.networkmanager.enable = true;
	networking.firewall = { 
		enable = true;
		#allowedTCPPorts = [12345];
	};
}
