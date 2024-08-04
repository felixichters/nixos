{ config, pkgs, lib, ... }:

{
	stylix.image = ./solid-light.jpeg;
	stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
	
	programs.neovim.plugins = with pkgs.vimPlugins; [
		{
      plugin = catppuccin-nvim;
			config = "colorscheme catppuccin-latte";
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
			bbackground: linear-gradient(90deg, #dce0e8 0%, #e6e9ef 100%);	
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
			color: #4c4f69;
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
      color: #4c4f69;
		}
  '';  

}
