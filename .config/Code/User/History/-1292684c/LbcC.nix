{config, lib, pkgs, ...}:

{
  imports = [
		./keybindings.nix
	];
  
  home.packages = with pkgs; [
    autotiling
  ]; 
  
  wayland.windowManager.sway = {
    enable = true;
    #wrapperFeatures.gtk = true;
    extraConfig = ''
      default_border pixel 2
      exec_always autotiling -w 1 2 3
      # Make unfocused windows transparent
for_window [tiling] opacity 0.8

# Make focused window fully opaque
for_window [focused] opacity 1

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
        inner = 15;
      };
      
      bars = [{
        "command" = "${pkgs.waybar}/bin/waybar";
      }]; 
    
    };
  };
}
