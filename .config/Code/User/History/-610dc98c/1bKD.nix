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
        gaps_out = "15";
        resize_on_border = "true";
        extend_border_grab_area = "15";
      };

      dwindle = {
        no_gaps_when_only = "1";
      };

      decoration = {
        rounding = "10";
        #active_opacity = "1.0";
        #inactive_opacity = "0.9";
        shadow_range = "10";
        #shadow_scale = "0.9";
        "col.shadow" = lib.mkForce "rgba(1a1a1aee)";
        dim_inactive = "true";
        dim_strength = "0.1";
        layerrule = [
          "blur, waybar"
        ];
        blur = {
          size = "8";
          noise = "0.1";
          contrast = "0.0";
          brightness = "0.0";
          vibrancy = "0.0";
        };
      };
      
      animation = [
        "fade, 1, 3, default"
        "windows, 1, 3, default, popin"
        "workspaces, 1, 5, default"
      ];

      windowrule = [ 
        "opacity 0.8 0.8, mako"
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