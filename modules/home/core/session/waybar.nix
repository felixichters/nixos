{config, lib, theme, ...}:
{

	options.waybar.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable waybar";
	};

	config = lib.mkIf config.waybar.enable { 	
		programs.waybar = {
			enable = true;
			settings = {
				mainBar = {
					layer = "top";
					position = "top";
					height = 27;
					modules-left = [ "sway/workspaces" "custom/scratchpad" "mpris"];
					modules-center = ["clock"];
					modules-right = ["custom/ssh" "custom/vpn" "network" "pulseaudio" "backlight" "battery" ];
					
					"custom/scratchpad" = {
						interval = 3;
						return-type = "json";
						exec = "swaymsg -t get_tree | jq --unbuffered --compact-output '(recurse(.nodes[]) | select(.name == \"__i3_scratch\") | .focus) as $scratch_ids | [..  | (.nodes? + .floating_nodes?) // empty | .[] | select(.id |IN($scratch_ids[]))] as $scratch_nodes | if ($scratch_nodes|length) > 0 then { text: \"\\($scratch_nodes | length)\", tooltip: $scratch_nodes | map(\"\\(.app_id // .window_properties.class) (\\(.id)): \\(.name)\") | join(\"\\n\") } else empty end'";
						format = "{}";
						on-click = "exec swaymsg 'scratchpad show'";
						on-click-right = "exec swaymsg 'move scratchpad'";
					};
					#"sway/workspaces" = {
					#	format = "{icon}";
					#	format-icons = {
					#		default = "";
					#		focused = "";
					#	};
					#};
					"custom/ssh" = {
						format = "SSH";
						exec = "echo SSH";
						exec-if = "ss -t -p | grep -q 'ESTAB.*ssh'";
						interval = 10;
						tooltip = false;
					};
					"custom/pubip" = {
						format = "PUB-IP {}";
						#exec = "curl -4 -s --connect-timeout 5 https://ifconfig.me";
						intervall = 50;
						tooltip = false;
					};
					"custom/vpn" = {
						format = "VPN";
						exec = "echo '{\"class\": \"connected\"}'";
						exec-if = "test -d /proc/sys/net/ipv4/conf/tun0";
						return-type = "json";
						interval = 5;
						tooltip = false;
					};
					"cpu" = {
						interval = 1;
						format = "CPU {usage}%";
						tooltip = false;
					};
					"clock" = {
						format-alt = "{:%Y/%d/%m}";
						format = "{:%H:%M}";
						tooltip = false;
					};
					"battery" = {
						states = {
							good = 95;
							warning = 30;
							critical = 15;
						};
						format = "";
						tooltip-format = "{capacity}%";
						tooltip = true;
					};
					"network" = {
						format = "{ifname}";
						format-wifi = "";
						tooltip-format-wifi = "{ifname} {essid} ({signalStrength}%) {ipaddr}";
						format-ethernet = "{ipaddr}";
						tooltip-format-ethernet = "{ifname}";
						format-disconnected = "down";
						interval = 5;
						tooltip = true;
					};
					"backlight" = {
						format = "";
						tooltip-format = "{percent}%";
						tooltip = true;
					};  
					"memory" = {
						format = "RAM {used} / {total}";
						interval = 5;
						tooltip = false;
					};
					"disk" = {
						format = "DISK {used} / {total}";
						tooltip = false;
					};
					"pulseaudio" = {
						format = "";
						format-bluetooth = "";
						format-muted = "";
						tooltip-format = "{desc} {volume}%" ;
					};
					"temperature" = {
						format = "{temperatureC}°C";
						tooltip = false;
					};
					"custom/power" = {
						format = "POWER";
						on-click = "swaynag -t warning -m 'poweroff?' -B 'yes' 'systemctl poweroff'";
						tooltip = false; 
					};
					"mpris" = {
						format = "{status_icon}  {artist} - {title}";
						status-icons = {
							paused = "";
							playing = "";
							stopped = "";
						};
						#player-icons = {
						#	default = "";
						#	spotify = "";
						#};
						ignored-players = ["firefox"];
						tooltip-format = "{player} ({status}): {artist} - {title} - ({album}) [{length}]";
					};
				};
			};
			style = ''	
				* {
					border-radius: 0;
					font-family: "FiraCode Nerd Font";
					font-size: 12px;
					min-height: 0;
				}
				tooltip {
					background: ${theme.background_alt};
					border: 1px solid ${theme.border_unfocused};
				}
				tooltip label {
					color: ${theme.foreground};
				}
				window#waybar {
					background-color: ${theme.background_alt};
						
				}
				
				#workspaces button {
					padding: 0 4px;
					color: ${theme.border_unfocused};
				}
				#workspaces button.focused {
					color: ${theme.foreground}
				}
				
				#workspaces button:hover {
					color: ${theme.foreground};
					background: none;
					box-shadow: none;
					text-shadow: none;
					border: none;
					transition: none;
				}
				
				#custom-scratchpad {
					padding: 0 14px;
					color: ${theme.foreground};
					border-bottom: 2px solid ${theme.border_focused};
				}
				#custom-power,
				#battery,
				#network,
				#backlight,
				#clock,
				#pulseaudio,
				#cpu,
				#memory,
				#disk,
				#temperature, 
				#custom-vpn,
				#custom-ssh,
				#mpris
				{
					padding: 0 15px;
					color: ${theme.foreground};
				}
				#custom-ssh {
					color: ${theme.color04};
					border-top: 2px solid ${theme.color04};
				}
				#custom-vpn {
					color: ${theme.color04};
					border-top: 2px solid ${theme.color04};
				}
				#pulseaudio.bluetooth {
					color: ${theme.color04};
				}
				#pulseaudio.muted {
					color: ${theme.color01};
				}
				#network.disconnected, #network.disabled {
					color: ${theme.color01};
				}
				#network.wifi {
					color: ${theme.foreground};
				}
				#network.ethernet {
					color: ${theme.foreground};
				}
				#battery.critical {
					color: ${theme.color01};
				}
				#battery.charging {
					color: ${theme.color02};
				}
				#temperature.critical {
					color: ${theme.color01};
				}
			'';  

		};
	};
}
