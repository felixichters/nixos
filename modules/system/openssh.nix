{lib, config, ...}:
{
	options.openssh.enable = lib.mkOption {
			type = lib.types.bool;
			default = false;
			description = "enable openssh service";
	};

	config = lib.mkIf config.openssh.enable {
		services.openssh = {
			enable = true;
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
	};
}
