{config, pkgs, lib, ...}:

{
	options.security.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable security tools";
	};
	config = lib.mkIf config.security.enable {
		home.packages = with pkgs; [
			keepassxc
			openvpn
			openconnect
			networkmanager-openconnect
			tor-browser
			nmap
			netcat-gnu
			tcpdump
		];
		programs.gpg.enable = true;
	};
}
