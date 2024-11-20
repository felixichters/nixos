{config, pkgs, lib, ...}:

{
	options.itsec.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable itsec tools";
	};
	config = lib.mkIf config.itsec.enable {
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
		];
	};
}
