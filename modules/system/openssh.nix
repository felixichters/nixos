{...}:
{
	services.openssh = {
		enable = false;
		ports = [ 22 ];
		banner = "little pig little pig, let me come in!";
		openFirewall = true;
		settings = {
			PasswordAuthentication = true;
			KbdInteractiveAuthentication = false;
			AllowUsers = null; 
			UseDns = true;
			UsePAM = true;
			X11Forwarding = true;
			StrictModes = true;
			PermitRootLogin = "prohibit-password";
		};
	};
}
