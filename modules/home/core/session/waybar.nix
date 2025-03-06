{config, lib, pkgs, ...}:
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
					output = [
						"eDP-1"
						"HDMI-A-1"
					];
					modules-left = [ "sway/workspaces" "custom/scratchpad"];
					modules-right = [ "custom/ssh" "custom/vpn" "network" "memory" "cpu" "temperature" "pulseaudio" "backlight" "battery" "clock" ];
					
					"custom/scratchpad" = {
						interval = 3;
						return-type = "json";
						exec = "swaymsg -t get_tree | jq --unbuffered --compact-output '(recurse(.nodes[]) | select(.name == \"__i3_scratch\") | .focus) as $scratch_ids | [..  | (.nodes? + .floating_nodes?) // empty | .[] | select(.id |IN($scratch_ids[]))] as $scratch_nodes | if ($scratch_nodes|length) > 0 then { text: \"\\($scratch_nodes | length)\", tooltip: $scratch_nodes | map(\"\\(.app_id // .window_properties.class) (\\(.id)): \\(.name)\") | join(\"\\n\") } else empty end'";
						format = "{}";
						on-click = "exec swaymsg 'scratchpad show'";
						on-click-right = "exec swaymsg 'move scratchpad'";
					};
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
						format = "BAT {capacity}%";
						tooltip = false;
					};
					"network" = {
						format = "{ifname}";
						format-wifi = "{essid} ({signalStrength}%) {ipaddr}";
						tooltip-format-wifi = "{ifname}";
						format-ethernet = "{ipaddr}";
						tooltip-format-ethernet = "{ifname}";
						format-disconnected = "down";
						interval = 5;
						tooltip = true;
					};
					"backlight" = {
						format = "BL {percent}%";
						tooltip = false;
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
						format = "VOL {volume}%";
						tooltip-format = "{desc}" ;
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
				};
			};
			style = ''	
				* {
					border-radius: 0;
					font-family: "IBM Plex Mono";
					font-size: 12px;
					min-height: 0;
				}
				tooltip {
					background: #191919;
					border: 1px solid #2a2a2a;
				}
				tooltip label {
					color: #cccccc;
				}
				window#waybar {
					background-color: #191919;
				}
				
				#workspaces button {
					padding: 0 4px;
					color: #7a7a7a;
				}
				
				#workspaces button.focused {
					color: #deeeed;
					background: #708090;
				}
				#workspaces button:hover {
					color: #deeeed;
					background: #444444;
					box-shadow: none;
					text-shadow: none;
					border: none;
					transition: none;
				}
				
				#custom-scratchpad {
					padding: 0 14px;
					color: #dddddd;
					background: #2a2a2a;
					border-top: 2px solid #708090;
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
				#custom-ssh
				{
					padding: 0 5px;
					color: #aaaaaa;
					border-left: 3px solid #2a2a2a;
				}
				#custom-ssh {
					color: #7788aa;
					border-top: 2px solid #708090;
				}
				#custom-vpn {
					color: #7788aa;
					border-top: 2px solid #708090;
				}
				#pulseaudio.bluetooth {
					color: #7788aa;
				}
				#pulseaudio.muted {
					color: #ffaa88;
				}
				#network.disconnected, #network.disabled {
					color: #d70000;
				}
				#network.wifi {
					color: #789978;
				}
				#network.ethernet {
					color: #708090;
				}
				#battery.critical {
					color: #d70000;
				}
				#battery.charging {
					color: #789978;
				}
				#temperature.critical {
					color: #ffaa88;
				}
			'';  

		};
	};
}
