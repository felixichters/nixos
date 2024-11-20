{config, lib, pkgs,  ...}:

{
	options.hyprland.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable hyprland";
	};
	
	config = lib.mkIf config.hyprland.enable {
		
		imports = [
			./keybindings.nix
		];
		
		home.packages = with pkgs; [
			xdg-utils
		];

		wayland.windowManager.hyprland = {	
			enable = true;
			plugins = with pkgs; [
				#hyprlandPlugins.hyprexpo
				hyprlandPlugins.hyprspace
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

				animation = [
					"fade, 0, 3, default"
					"windows, 0, 2, default, slide"
					"layers, 1, 2, default, slide"
					"workspaces, 1, 5, default"
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
