{ config, lib, ... }:

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
				name = "IBM Plex Mono";
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
				background #101010
				foreground #cccccc
				selection_background #cccccc
				selection_foreground #101010
				cursor none
				url_color #aaaaaa
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
				color0 #080808
				color1 #d70000
				color2 #789978
				color3 #ffaa88
				color4 #708090
				color5 #789978
				color6 #7788aa
				color7 #dddddd

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
	};
}
