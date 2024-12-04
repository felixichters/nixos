{config, lib, pkgs,  ...}:

{
	options.hyprland.enable = lib.mkOption {
		type = lib.types.bool;
		default = false;
		description = "enable hyprland";
	};		
	
	imports = [
		./keybindings.nix
	];
	
	config = lib.mkIf config.hyprland.enable {
	


		wayland.windowManager.hyprland = {	
			enable = true;
			plugins = with pkgs; [
				#hyprlandPlugins.hyprexpo
				#hyprlandPlugins.hyprspace
			];

			settings =  {
				monitor = [ 
					"eDP-1, 1920x1080@60, 0x0, 1"
					"HDMI-A-1, preferred, 0x0, 1" 
				];
				exec-once = [
					"waybar"
					#"swaylock -C ~/.dotfiles/home/hyprland/swaylock --screenshots --clock --effect-blur 10x10"
				];
				input = {
					kb_layout = "de";
					touchpad = {
						natural_scroll = "true";
					};
					scroll_factor = "0.7";
				};

				gestures = {
					workspace_swipe = "true";
					workspace_swipe_fingers = "3";
				};

				misc = {
					disable_hyprland_logo = "true";
					force_default_wallpaper = "0";
				};
				general = {
					border_size = "2";
					gaps_in = "0";
					gaps_out = "0";
					resize_on_border = "true";
					extend_border_grab_area = "20";
					"col.active_border" = lib.mkForce "0xff789978";
					"col.inactive_border" = lib.mkForce "0xff2a2a2a";
				};

				dwindle.no_gaps_when_only = "0";
				decoration = {
					rounding = "0";
					drop_shadow = "false";
					shadow_range = "15";
					shadow_offset = "5 5";
					"col.shadow" = lib.mkForce "rgba(000000a1)";
					"col.shadow_inactive" = lib.mkForce "rgba(00000050)";
					dim_inactive = "true";
					dim_strength = "0.2";
				};
		
				bind = [
					"SUPER, R, exec, ./.config/rofi/launchers/type-1d/launcher.sh"
				];

				animation = [
					"fade,0"

					"border, 0"	
					"windows, 0, 2, default, slide"
					"layers, 1, 2, default, slide"
					"workspaces, 1, 4, default"
				];

				windowrule = [ 
					"opacity 0.8 0.8, mako"
				];
				windowrulev2 = [
					"opacity 1.0 1.0,class:^(kitty)$"
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
	};
}
