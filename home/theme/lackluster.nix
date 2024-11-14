{ config, pkgs, lib, inputs, ... }:

{
	nixpkgs.overlays = [
  inputs.nixneovimplugins.overlays.default
];
	stylix.image = ./car.jpg;
	stylix.base16Scheme = {	
		base00 = "101010"; #  ----
		base01 = "2a2a2a"; #  ---
		base02 = "444444"; #  --
		base03 = "555555"; #  -
		base04 = "aaaaaa"; #  +
		base05 = "cccccc"; #  ++
		base06 = "dddddd"; #  +++
		base07 = "deeeed"; #  ++++
		base08 = "d70000"; # red 
		base09 = "ffaa88"; # orange
		base0A = "ffaa88"; # yellow 
		base0B = "789978"; # green
		base0C = "7788aa"; # cyan
		base0D = "708090"; # blue 
		base0E = "789978"; # purple 
		base0F = "7788aa"; # brown
	};

	programs.neovim.plugins = [
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

	programs.waybar.settings.mainBar = {
		modules-left = ["hyprland/workspaces"];
		modules-center = ["hyprland/window"];
	};

	programs.waybar.style = ''	
		* {
			font-family: "Fira Code";
			font-size: 11px;
			padding: 0;
			margin: 0;
		}
		
		window#waybar {
			background-color: #191919;
		}
    
		@keyframes button_activate {
			from { opacity: .1 }
			to { opacity: 1.; }
		}
		
		#workspaces {
			border-bottom: none ;
		}

		#workspaces button {
			border-bottom: none;
			opacity: .35;
    	transition: all 0.2s ease-in-out;
			color: #dddddd;
			padding-left: 7px;
			padding-right: 7px;
		}

		#workspaces button.active {
			border-bottom: none;
    	transition: all 0.1s ease;
			opacity: 1.;
			color: #deeeed;
			border-radius: 0px;
			background: #708090
		}

		#workspaces button.urgent {
			border-bottom: none;
			opacity: 1.;
		}

		#workspaces button:hover {	
			box-shadow: inherit;
			text-shadow: inherit;
			background: #2a2a2a;
			opacity: 1.;
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

}
