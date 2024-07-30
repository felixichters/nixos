{ config, pkgs, lib, inputs, ... }:

{
	#	nix.settings = {
	#  substituters = ["https://hyprland.cachix.org"];
	#  trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
	# };
	programs.hyprland.enable = true;
	#	programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
	
	#programs.swaylock.enable = true;
	security.pam.services.swaylock = {};

	services.greetd = {
  	enable = true;
  	settings = rec {
    	initial_session = {
      	command = "${pkgs.hyprland}/bin/hyprland";
      	user = "navi";
    	};
    	default_session = initial_session;
  	};
	};
	security.polkit.enable = true;
}
