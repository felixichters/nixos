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
			bitwarden
			openvpn
			openconnect
			networkmanagerapplet
			networkmanager-openconnect
			tor-browser
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
			metasploit
			ettercap
		];
		programs.gpg.enable = true;
	};
}
