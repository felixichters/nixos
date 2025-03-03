{hostname, ... }:

{
	networking.hostName = hostname; 
	networking.networkmanager.enable = true;
	networking.firewall = { 
		enable = true;
		#allowedTCPPorts = [12345];
	};
}
