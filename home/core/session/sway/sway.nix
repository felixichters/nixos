{config, lib, pkgs, ...}:

{
	options.sway.enable = lib.mkOption {
		type = lib.types.bool;
		default = false;
		description = "enable sway";
	};
  
	imports = [
		./keybindings.nix
	];
	
	config = lib.mkIf config.sway.enable {
		wayland.windowManager.sway = {
			enable = true;
			config = {
				modifier = "Mod4";
				terminal = "kitty";
				window.titlebar = false;
				window.border = 2;
				gaps = {
					smartBorders = "on";
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
					names = ["Iosevka"];
					size = 10.0;
				};
				bars = [{
					position = "top";
					statusCommand = "i3status";
					trayOutput = "none";
					fonts = {
						names = ["Iosevka"];
						size = 11.0;
					};
					colors = {
						background = "#191919";
						statusline = "#aaaaaa";
						separator = "#7a7a7a";
						focusedWorkspace = {
							background = "#708090";
							border = "708090";
							text = "cccccc";
						};
						activeWorkspace = {
							background = "#444444";
							border = "#789978";
							text = "aaaaaa";
						};
						inactiveWorkspace = {
							background = "#2a2a2a";
							border = "#191919";
							text = "#7a7a7a";
						};
					};
				}];
				colors = {
					background = "#101010";
					focused = {
						border = "#708090";
						background = "#708090";
						text = "#cccccc";
						indicator = "708090";
						childBorder = "708090";
					};
					focusedInactive = {
						border = "#708090";
						background = "#7a7a7a";
						text = "#cccccc";
						indicator = "#708090";
						childBorder = "#708090";
					};
					unfocused = {
						border = "#2a2a2a";
						background = "#191919";
						text = "#aaaaaa";
						indicator = "#2a2a2a";
						childBorder = "#2a2a2a";
					};
					urgent = {
						border = "d70000";
						background = "ffaa88";
						text = "deeeed";
						indicator = "d70000";
						childBorder = "d70000";
					};
				};
			};
		};
		programs.i3status = {
			enable = true;
			enableDefault = false;
			general = {
				colors = true;
				color_good = "#789978";
				color_degraded = "#ff88aa";
				color_bad = "#d70000";
				interval = 5;
			};
			modules = {
				"time" = {
					position = 6;
					settings = {
						format = "%Y-%m-%d %H:%M";
					};
				};
				"battery 0" = {
					position = 5;
					settings = {
						format = "%status %percentage";
						low_threshold = "30";
					};
				};
				"wireless _first_" = {
					position = 3;
					settings = {
						format_up = "(%bitrate %essid) %ip";
						format_down = "down";
					};
				};
				"volume master" = {
    			position = 4;
    			settings = {
      			format = "VOL %volume";
      			format_muted = "MUTE (%volume)";
      			device = "default";
    			};
				};
				"memory" = {
					position = 1;
					settings = {
						format = "MEM %used / %total";
						threshold_degraded = "10%";
						threshold_critical = "5%";
					};
				};
				"cpu_usage" = {
					position = 2;
					settings = {
						format = "CPU %usage";
						max_threshold = "75";
					};
				};
			};
		};
	};
}
