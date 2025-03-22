{...}:
{
	security.sudo.extraConfig = ''
		Defaults timestamp_timeout=30
	'';
	networking.firewall = { 
		enable = true;
		#allowedTCPPorts = [12345];
	};
}
