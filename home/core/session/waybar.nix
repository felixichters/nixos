{config, lib, pkgs, ...}:
{

	options.waybar.enable = lib.mkOption {
		type = lib.types.bool;
		default = false;
		description = "enable waybar";
	};

	config = lib.mkIf config.waybar.enable { 	
		programs.waybar = {
			enable = true;
			settings = {
				mainBar = {
					layer = "top";
					position = "top";
					#height = 5;
					output = [
						"eDP-1"
						"HDMI-A-1"
					];
					modules-left = [ "hyprland/workspaces" ];
					modules-center = [ "hyprland/window" ];
					modules-right = [ "disk" "memory" "cpu" "backlight" "pulseaudio" "battery" "network" "clock" ];

					"hyprland/window" = {
						format = "{initialTitle}"; 
					};
					"cpu" = {
						interval = 1;
						format = "{icon}";
						format-alt = "CPU {usage}%";
						format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
						tooltip = false;
					};
					"clock" = {
						format-alt = "{:%Y/%m/%d}";
						format = "{:%H:%M}";
						tooltip = false;
					};
					"battery" = {
						states = {
							good = 95;
							warning = 30;
							critical = 15;
						};
						format = "{icon}";
						format-alt = "{capacity}%";
						# "format-good" = ""; # An empty format will hide the module
						# "format-full" = "";
						format-icons = [ "" "" "" "" "" ];
						tooltip = false;
					};
					"network" = {
						# "interface" = "wlp2s0"; # (Optional) To force the use of this interface
						format-wifi = "";
						format-alt = "{essid} ({signalStrength}%)";
						format-disconnected = "";
						interval = 7;
						tooltip = false;
					};
					"backlight" = {
						format = "{icon}";
						format-icons = ["" "" "" "" "" "" "" "" "" ""];
						tooltip = false;
					};  
					"memory" = {
						format = "{icon}";
						format-alt= "RAM {}%";
						format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
						tooltip = false;
					};
					"disk" = {
						format = " ";
						format-alt = "{used} / {total}";
						tooltip = false;
					};
					"pulseaudio" = {
						format = "{icon}";
						format-alt = "{volume}%";
						format-bluetooth = "{volume}% {icon}";
						format-muted = "";
						format-icons = {
							headphones = "";
							default = ["" ""];
						};
						tooltip = false;
						states = {

						};
					};

					"custom/power" = {
						format = "";
						on-click = "~/.config/rofi/powermenu/type-4/powermenu.sh";
						tooltip = false; 
					};
				};
			};
			style = ''	
				* {
					font-family: "Fira Code";
					font-size: 11px;
					padding: 0;
					margin: 0;
				}
				
				window#waybar {
					background-color: #191919;
				}
				
				#workspaces {
					border-bottom: none ;
				}

				#workspaces button {
					border-bottom: none;
					color: #dddddd;
					padding-left: 7px;
					padding-right: 7px;
				}

				#workspaces button.active {
					border-bottom: none;
					color: #deeeed;
					border-radius: 0px;
					background: #708090
				}

				#workspaces button.urgent {
					border-bottom: none;
					opacity: 1.;
				}

				#workspaces button:hover {	
					background: #2a2a2a;
					color: #deeeed;
					border-radius: 0px;
				}	
				
				#custom-power,
				#battery,
				#network,
				#backlight,
				#clock,
				#pulseaudio,
				#cpu,
				#memory,
				#disk
				{
					padding: 0 8px;
					color: #cccccc;
				}
			'';  

		};
	};
}
