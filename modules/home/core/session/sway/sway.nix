{config, lib, pkgs, theme, ...}:
{
	options.sway.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable sway";
	};
  
	imports = [
		./keybindings.nix
	];
	
	config = lib.mkIf config.sway.enable {
		programs.swaylock.enable = true;
		wayland.windowManager.sway = {
			enable = true;
			xwayland = true;
			config = {
				modifier = "Mod4";
				terminal = "kitty";
				window.titlebar = false;
				window.border = 2;
				gaps = {
					inner = 10;
					smartBorders = "on";
					smartGaps = true;
				};
				input = {
					"*" = {
						xkb_layout = "de";
					};
					"type:touchpad" = {
						natural_scroll = "enabled";
					};
				};
				fonts = {
					names = ["FiraCode Nerd Font"];
					size = 10.0;
				};
				output."*".bg = "${theme.wallpaper} solid_color";
				bars = [{
					command = "${pkgs.waybar}/bin/waybar";
				}];
				colors = {
					background = theme.background;
					focused = {
						border = theme.border_focused;
						background = theme.border_focused;
						text = theme.foreground;
						indicator = theme.border_focused;
						childBorder = theme.border_focused;
					};
					focusedInactive = {
						border = theme.border_unfocused;
						background = theme.border_unfocused;
						text = theme.foreground;
						indicator = theme.border_unfocused;
						childBorder = theme.border_unfocused;
					};
					unfocused = {
						border = theme.border_unfocused;
						background = theme.border_unfocused;
						text = theme.foreground;
						indicator = theme.border_unfocused;
						childBorder = theme.border_unfocused;
					};
					urgent = {
						border = theme.color01;
						background = theme.color01;
						text = theme.foreground;
						indicator = theme.color01;
						childBorder = theme.color01;
					};
				};
			};
		};
	};
}
