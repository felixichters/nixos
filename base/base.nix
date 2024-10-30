{ config, pkgs, lib, ... }:

{

	imports = [
		./navi.nix 
		./networking.nix 
		./sound.nix
		./fonts.nix
		./packages.nix
		./session.nix
	];
	
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	
	programs.dconf.enable = true;
	
	services.udisks2.enable = true;
	services.gvfs.enable = true;
	hardware.graphics.enable = true;
	
	security.pam.services.swaylock = {};
	
	time.timeZone = "Europe/Berlin";

	i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

	services.xserver = {
		xkb.layout = "de";
		xkb.variant = "";
	};

	console.keyMap = "de";
	
	services.thermald.enable = true;

	services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
			CPU_SCALING_GOVERNOR_ON_BAT = "performance";

  		CPU_ENERGY_PERF_POLICY_ON_BAT = "performance";
  		CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

  		CPU_MIN_PERF_ON_AC = 0;
  		CPU_MAX_PERF_ON_AC = 100;
  		CPU_MIN_PERF_ON_BAT = 0;
  		CPU_MAX_PERF_ON_BAT = 50;

 			#Optional helps save long term battery health
		 	START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
 			STOP_CHARGE_THRESH_BAT0 = 90; # 80 and above it stops charging

    };
	};


}
