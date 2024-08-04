{ config, pkgs, lib, ... }:

{
	stylix.image = ./solid-dark.jpeg;
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

	programs.neovim.plugins = with pkgs.vimPlugins; [
		{
      plugin = catppuccin-nvim;
			config = "colorscheme lackluster";
    }
	];
	
	programs.waybar.style = ''	
		* {
			font-family: "JetBrainsMono Nerd Font";
			font-size: 11px;
			padding: 0;
			margin: 0;
		}
		
		window#waybar {
			background: linear-gradient(90deg, #080808 0%, #191919 100%);
			m
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
