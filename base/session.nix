{ config, pkgs, lib, inputs, ... }:

{
	programs.hyprland.enable = true;
	security.pam.services.swaylock = {};
	security.polkit.enable = true;
	
	#services.displayManager.ly.enable = true;
	#	environment.systemPackages = [(
	#  	pkgs.catppuccin-sddm.override {
	#    	flavor = "latte";
	#			#font  = "Noto Sans";
	#    	fontSize = "9";
	#			background = "${../home/theme/a1.png}";
	#			loginBackground = true;
	#  	}
	#	)];
	#	
	#	services.displayManager.sddm = {
	#  	enable = true;
	#		wayland.enable = true;
	#  	theme = "catppuccin-latte";
	#		package = pkgs.kdePackages.sddm;
	#	};
}
