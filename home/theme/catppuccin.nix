{ config, pkgs, lib, ... }:

let 
	to_lua = str: "lua << EOF\n${str}\nEOF\n";
in 
{
	stylix.image = ./solid-light.jpeg;
	stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
	
	stylix.targets.kitty.enable = false;
	

 	wayland.windowManager.hyprland.settings = {
    general = {
			border_size = "0";
    	gaps_in = "10";
    	gaps_out = "15";
    	resize_on_border = "true";
    	extend_border_grab_area = "30";
		};
		decoration = {
      rounding = "10";
      shadow_range = "12";
      shadow_offset = "3 3";
			#shadow_scale = "0.9";
			"col.shadow" = lib.mkForce "rgba(000000a1)";
      "col.shadow_inactive" = lib.mkForce "rgba(00000070)";
      dim_inactive = "true";
      dim_strength = "0.2";
      blur = {
        size = "16";
        noise = "0.0117";
        contrast = "1.0";
        brightness = "0.3";
        vibrancy = "0.1696";
      };
    };
	};

	programs.waybar.settings.mainBar = {
		modules-left = [ "hyprland/workspaces"];
		modules-center = [];
		
		"hyprland/workspaces" = {
			disable-scroll = true;
		  disable-markup = false;
	    active-only = true;
	    all-outputs = true;
	    show_special = true;
	    format = "{icon}";
	    format-icons = {
	      #"1" = "";
	      #"2" = "";
	      #"3" = "";
	      #"4" = "";
	      #"5" = "";
	      #"9" = "";
	      special = "";
	      active = "  ";
	      default = "  ";
	      #persistant = "";
	    };
			persistent-workspaces = {
				"1" = [];
				"2" = [];
				"3" = [];
			};
	    tooltip = false;
	  };
	};

	programs.kitty.extraConfig = ''
		# The basic colors
		foreground              #4c4f69
		background              #eff1f5
		selection_foreground    #eff1f5
		selection_background    #dc8a78

		# Cursor colors
		cursor                  #dc8a78
		cursor_text_color       #eff1f5

		# URL underline color when hovering with mouse
		url_color               #dc8a78

		# Kitty window border colors
		active_border_color     #7287fd
		inactive_border_color   #9ca0b0
		bell_border_color       #df8e1d

		# OS Window titlebar colors
		wayland_titlebar_color system
		macos_titlebar_color system

		# Tab bar colors
		active_tab_foreground   #eff1f5
		active_tab_background   #8839ef
		inactive_tab_foreground #4c4f69
		inactive_tab_background #9ca0b0
		tab_bar_background      #bcc0cc

		# Colors for marks (marked text in the terminal)
		mark1_foreground #eff1f5
		mark1_background #7287fd
		mark2_foreground #eff1f5
		mark2_background #8839ef
		mark3_foreground #eff1f5
		mark3_background #209fb5

		# The 16 terminal colors

		# black
		color0 #5c5f77
		color8 #6c6f85

		# red
		color1 #d20f39
		color9 #d20f39

		# green
		color2  #40a02b
		color10 #40a02b

		# yellow
		color3  #df8e1d
		color11 #df8e1d

		# blue
		color4  #1e66f5
		color12 #1e66f5

		# magenta
		color5  #ea76cb
		color13 #ea76cb

		# cyan
		color6  #179299
		color14 #179299

		# white
		color7  #acb0be
		color15 #bcc0cc	
	'';

	programs.neovim.plugins = with pkgs.vimPlugins; [
		{
      plugin = catppuccin-nvim;
			config = "autocmd VimEnter * colorscheme catppuccin-latte";
    }
	];
	
	programs.waybar.style = ''	
		* {
			font-family: "Fira Code";
  		font-size: 11px;
			padding: 0;
			margin: 0;
		}
		
		window#waybar {
			background: linear-gradient(90deg, #dce0e8 0%, #e6e9ef 100%);	
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
