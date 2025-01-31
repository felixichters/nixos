{config, pkgs, lib, ...}:

{
	options.security.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable security tools";
	};
	config = lib.mkIf config.security.enable {
		home.packages = with pkgs; [
			openvpn
			openconnect
			nmap
			masscan
			hashcat
			netcat-gnu
			dsniff
			arp-scan
			tcpdump
			thc-hydra
			john
			sqlmap
			ccrypt
			prelink
		];
		programs.gpg.enable = true;
	};
}
