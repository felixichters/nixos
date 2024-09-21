{ config, pkgs, lib, inputs, ... }:

{
	programs.hyprland.enable = true;
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
