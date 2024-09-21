{ config, pkgs, lib, inputs, ... }:

{
	nixpkgs.overlays = [
  inputs.nixneovimplugins.overlays.default
];
	stylix.image = ./wallhaven-dark.jpg;
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
		base0E = "789978"; #purple 
		base0F = "7788aa"; #brown
	};

	programs.neovim.plugins = [
		{
      plugin = pkgs.vimExtraPlugins.lackluster-nvim;
			config = "autocmd VimEnter * colorscheme lackluster";
    }
	];
	wayland.windowManager.hyprland.plugins = [
    pkgs.hyprlandPlugins.borders-plus-plus
  ];
	
	wayland.windowManager.hyprland.settings = {
		general = {
			border_size = "5";
			gaps_in = "10";
			gaps_out = "15";
			resize_on_border = "true";
			extend_border_grab_area = "20";
		};

		decoration = {
			rounding = "5";
			shadow_range = "15";
			shadow_offset = "5 5";
			"col.shadow" = lib.mkForce "rgba(000000a1)";
      "col.shadow_inactive" = lib.mkForce "rgba(00000050)";
			dim_inactive = "true";
			dim_strength = "0.3";
		};
	};

	programs.waybar.settings.mainBar = {
		modules-left = ["hyprland/workspaces"];
		modules-center = [];
	};

	programs.waybar.style = ''	
		* {
			font-family: "Fira Code";
			font-size: 11px;
			padding: 0;
			margin: 0;
		}
		
		window#waybar {
			background: #080808;
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
    	transition: all 0.3s ease-in-out;
			color: #aaaaaa;
		}

		#workspaces button.active {
			padding: 0 7px;
			border-bottom: none;
    	transition: all 0.1s ease;
			opacity: 1.;
			color: inherit;
		}

		#workspaces button.urgent {
			border-bottom: none;
		opacity: 1.;
		}

		#workspaces button:hover {	
			box-shadow: inherit;
			text-shadow: inherit;
			background: inherit;
			opacity: 1.;
			color: inherit;
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
      color: #aaaaaa;
		}
  '';  

}
