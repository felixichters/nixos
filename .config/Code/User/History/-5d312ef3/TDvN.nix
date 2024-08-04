{ config, pkgs, lib, ... }:

{
	programs.hyprland.enable = true;
	
	services.greetd = {
  	enable = true;
  	settings = rec {
    	initial_session = {
      	command = "${pkgs.sway}/bin/sway";
      	user = "navi";
    	};
    	default_session = initial_session;
  	};
	};
	security.polkit.enable = true;
}
