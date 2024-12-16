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
			nmap
			masscan
			hashcat
			netcat
			dsniff
			arp-scan
			tcpdump
			thc-hydra
			john
			sqlmap
			ccrypt
		];
	};
}
