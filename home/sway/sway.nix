{config, lib, pkgs, ...}:

{
  imports = [
		./keybindings.nix
	];
  
  home.packages = with pkgs; [
    #autotiling
  ]; 
  
	#programs.swaylock.enable = true;
  wayland.windowManager.sway = {
    enable = true;
    #wrapperFeatures.gtk = true;
    extraConfig = ''
      default_border pixel 2
      exec_always autotiling -w 1 2 3

    '';
    
    config = rec {
      input = {
        "*" = {
          xkb_layout = "de";
        };
        "type:touchpad" = {
          natural_scroll = "enabled";
        };
      };
      
      modifier = "Mod4";
      floating.modifier = "Mod4";
      terminal = "kitty";

      gaps = {
        smartGaps = true;
        smartBorders = "on";
        inner = 10;
      };
      
      bars = [{
        "command" = "${pkgs.waybar}/bin/waybar";
      }]; 
    
    };
  };
}
