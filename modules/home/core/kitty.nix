{ config, lib, theme, ... }:

{
	options.kitty.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable kitty";
	};

	config = lib.mkIf config.kitty.enable {
		programs.kitty = {
			enable = true;
			font = {
				name = "FiraCode Nerd Font";
				size = 11;
			};
			settings = {
				enable_audio_bell = false;
				confirm_os_window_close = 0;
				window_padding_width = 8;
				mouse_hide_wait = "-1.0";
				cursor_shape = "block";
				cursor_shape_unfocused = "hollow";
				cursor_blink_interval = "-1";
				cursor_stop_blinking_after = "0";
				cursor_trail = "1";
				cursor_trail_decay = "0.1 0.2";
				cursor_trail_start_threshold = "2";
				clear_all_shortcuts = "yes";
				#font_features = "FiraCodeRoman_400wght +cv31 +cv29 +ss10 +onum";
			};
			keybindings = {
				"ctrl+c" = "copy_and_clear_or_interrupt";
				"ctrl+shift+c" = "copy_to_clipboard";
				"ctrl+shift+v" = "paste_from_clipboard";

				"ctrl+shift+up" = "scroll_line_up";
				"ctrl+shift+k" = "scroll_line_up";
				"ctrl+shift+down" = "scroll_line_down";
				"ctrl+shift+j" = "scroll_line_down";
			};
			shellIntegration.mode = "no-cursor";
			shellIntegration.enableZshIntegration = true;
			extraConfig = ''
				background ${theme.background}
				foreground ${theme.foreground}
				selection_background ${theme.selection_bg}
				selection_foreground ${theme.selection_fg}
				cursor none

				# normal
				color0 ${theme.color00} 
				color1 ${theme.color01}
				color2 ${theme.color02}
				color3 ${theme.color03}
				color4 ${theme.color04}
				color5 ${theme.color05}
				color6 ${theme.color06}
				color7 ${theme.color07}

				# bright
				color8 ${theme.color08}
				color9 ${theme.color09}
				color10 ${theme.color10}
				color11 ${theme.color11}
				color12 ${theme.color12}
				color13 ${theme.color13}
				color14 ${theme.color14}
				color15 ${theme.color15}
			'';
		};
	};
}
