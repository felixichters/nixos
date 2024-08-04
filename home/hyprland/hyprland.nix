{config, lib, pkgs,  ...}:

{
  imports = [
		./keybindings.nix
	];
	
	#programs.swaylock.enable = true;

	wayland.windowManager.hyprland = {	
		enable = true;
		#package = inputs.hyprland.packages."${pkgs.system}".hyprland;	
   	plugins = with pkgs; [
			#hyprlandPlugins.hypr-dynamic-cursors
			hyprlandPlugins.hyprexpo
			hyprlandPlugins.hyprspace
			#hyprlandPlugins.hypr-dynamic-cursors
		];

		settings =  {

      monitor = [ 
				"eDP-1, 1920x1080@60, 0x0, 1"
				"HDMI-A-1, preferred, 0x0, 1, mirror, eDP-1" 
      ];
			exec-once = [
				"waybar"
				"swaylock --screenshots --clock --effect-blur 10x10"
			];
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
        gaps_in = "8";
        gaps_out = "13";
        resize_on_border = "true";
        extend_border_grab_area = "30";
      };

      dwindle = {
        no_gaps_when_only = "1";
      };

      misc = {
				disable_hyprland_logo = "true";
        force_default_wallpaper = "0";
      };

      decoration = {
        rounding = "10";
        #active_opacity = "1.0";
    #inactive_opacity = "0.9";
        shadow_range = "12";
        shadow_offset = "3 4";
				#shadow_scale = "0.9";
				"col.shadow" = lib.mkForce "rgba(000000a1)";
        "col.shadow_inactive" = lib.mkForce "rgba(00000070)";
        dim_inactive = "true";
        dim_strength = "0.1";
        blur = {
          size = "16";
          noise = "0.0117";
          contrast = "1.0";
          brightness = "0.3";
          vibrancy = "0.1696";
        };
      };
			
      
      animation = [
        "fade, 1, 3, default"
        "windows, 1, 2, default, popin"
        "workspaces, 1, 5, default"
      ];

      windowrule = [ 
        "opacity 0.8 0.8, mako"
				"noblur, kando"
				"size 100%, 100%, kando"
				"noborder, kando"
				"noanim, kando"
				"float, kando"
				"pin, kando"
      ];
			windowrulev2 = [
			 	"opacity 1.0 0.8,class:^(kitty)$"
				"opacity 1.0 1.0 ,title:^(.*NVIM.*)$"
				#"float, class:^(kitty)$"
				#"size 950 600, floating:1"
			];

			workspace = "3, monitor:HDMI-A-1";
			
			"plugin:hyprexpo" = {
				columns = "2";
				gap_size = "5";
				workspace_method = "center current";
				
				#enable_gesture = "true";
				
				#enabled = true;
				#mode = "tilt";
			};

    };
    extraConfig = ''
    ''; 
  };
}
