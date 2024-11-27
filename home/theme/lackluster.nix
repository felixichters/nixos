{ config, pkgs, lib, inputs, ... }:

{
	
	options.lackluster.enable = lib.mkOption {
		type = lib.types.bool;
		default = false; 
		description = "enable lackluster theme";
	};

	config = lib.mkIf config.lackluster.enable {
		#sway_config = lib.mkIf config.sway.enable {

		#};
		
		programs.waybar = lib.mkIf config.waybar.enable {
			
			settings.mainBar = {
				modules-left = ["sway/workspaces"];
				modules-center = ["sway/window"];

				"sway/workspaces" = {
					all-outputs = true;
					disable-scroll = true;
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

			programs.kitty = lib.mkIf config.kitty.enable {
				extraConfig = ''
					background #101010
					foreground #cccccc
					selection_background #cccccc
					selection_foreground #101010
					url_color #aaaaaa
					cursor #cccccc
					active_border_color #555555
					inactive_border_color #2a2a2a
					active_tab_background #101010
					active_tab_foreground #cccccc
					inactive_tab_background #2a2a2a
					inactive_tab_foreground #aaaaaa
					tab_bar_background #2a2a2a
					wayland_titlebar_color #101010
					macos_titlebar_color #101010

					# normal
					color0 #101010
					color1 #d70000
					color2 #789978
					color3 #ffaa88
					color4 #708090
					color5 #789978
					color6 #7788aa
					color7 #cccccc

					# bright
					color8 #555555
					color9 #ffaa88
					color10 #2a2a2a
					color11 #444444
					color12 #aaaaaa
					color13 #dddddd
					color14 #7788aa
					color15 #deeeed
				'';
			};

	#	stylix.image = ./wallpaper/car.jpg;
	#	stylix.base16Scheme = {	
	#		base00 = "101010"; #  ----
	#		base01 = "2a2a2a"; #  ---
	#		base02 = "444444"; #  --
	#		base03 = "555555"; #  -
	#		base04 = "aaaaaa"; #  +
	#		base05 = "cccccc"; #  ++
	#		base06 = "dddddd"; #  +++
	#		base07 = "deeeed"; #  ++++
	#		base08 = "d70000"; # red 
	#		base09 = "ffaa88"; # orange
	#		base0A = "ffaa88"; # yellow 
	#		base0B = "789978"; # green
	#		base0C = "7788aa"; # cyan
	#		base0D = "708090"; # blue 
	#		base0E = "789978"; # purple 
	#		base0F = "7788aa"; # brown
	#	};

	programs.neovim.plugins = lib.mkIf config.nvim.enable [
		{
      plugin = pkgs.vimExtraPlugins.lackluster-nvim;
			config = "autocmd VimEnter * colorscheme lackluster";
    }
	];
	wayland.windowManager.hyprland.plugins = [
		#pkgs.hyprlandPlugins.borders-plus-plus
	];
	
	wayland.windowManager.hyprland.settings = {
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
	};
	
	};
}
