{config, lib, pkgs, ...}:

{
  imports = [
		./keybindings.nix
	];

  wayland.windowManager.hyprland = {
    enable = true;
    settings =  {
      monitor = "eDP-1, 1920x1080@60, 0x0, 1";
      exec-once = "waybar";

      input = {
        kb_layout = "de";
        touchpad = {
          natural_scroll = "true";
        };
      };

      gestures = {
        workspace_swipe = "true";
        workspace_swipe_fingers = "3";
      };

      general = {
        border_size = "0";
        gaps_in = "10";
        gaps_out = "7";
        resize_on_border = "true";
        extend_border_grab_area = "15";
      };

      decoration = {
        rounding = "10";
        #active_opacity = "1.0";
        #inactive_opacity = "0.9";
        shadow_range = "50";
        dim_inactive = "true";
        dim_strength = "0.2";
        
        blur = {
          size = "13";
        };
      };
      
      layerrule = [
        "blur, waybar"
        "blur, fuzzel"
      ];
      animation = [
        "fade, 1, 3, default"
        "windows, 1, 3, default, popin"
        "workspaces, 1, 5, default"
      ];

      windowrule = [ 
        "opacity 0.8 0.8, dunst"
        "opacity 0.8 0.8, fuzzel"
        "opacity 0.8 0.8, kitty"
      ];
    };
    extraConfig = '' 
    '';
    
    plugins = with pkgs; [
    ];
  
  };
}