{config, lib, pkgs, ...}:

let
	mod = "Mod4";
	term = "kitty";
	menu = "tofi-run | xargs -r swaymsg exec --";
	files = "kitty ranger";
	power = "swaynag -t warning -m 'poweroff?' -B 'yes' 'systemctl poweroff'";
	reboot = "swaynag -t warning -m 'reboot?' -B 'yes' 'systemctl reboot'";
	exit = "exec swaynag -t warning -m 'exit sway?' -B 'yes' 'swaymsg exit'";
	lock = "swaylock -c 000000"; 
in
{

	config = lib.mkIf config.sway.enable {

		wayland.windowManager.sway.config.keybindings = {
			
			XF86AudioMute = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
			XF86AudioRaiseVolume = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
			"${mod}+Shift+plus" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
			XF86AudioLowerVolume = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
			"${mod}+Shift+minus" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
			
			XF86MonBrightnessUp = "exec light -A 1";
			XF86MonBrightnessDown = "exec light -U 1";
			"${mod}+o" = "exec light -A 10";
			"${mod}+i" = "exec light -U 10";

			"${mod}+Shift+r" = "reload";

			"${mod}+escape" = "exec ${lock}";

			"${mod}+Return" = "exec ${term}";
			
			"${mod}+q" = "kill";
			
			"${mod}+r" = "exec ${menu}";
			
			"${mod}+e" = "exec ${files}";
			#"${mod}+Shift+e" = "exec ${editor}";

			"${mod}+Shift+s" = "exec systemctl suspend";
			"${mod}+p" = "exec ${power}";
			"${mod}+Shift+p" = "exec ${reboot}";
			
			"${mod}+Shift+q" = "exec ${exit}";
			
			"${mod}+minus" = "exec swaymsg move scratchpad";
			"${mod}+plus" = "exec swaymsg scratchpad show";
			
			"${mod}+space" = "floating toggle";
			
			"${mod}+f" = "fullscreen";

			"${mod}+h" = "focus left";
			"${mod}+j" = "focus down";
			"${mod}+k" = "focus up";
			"${mod}+l" = "focus right"; 
			"${mod}+Left" = "focus left";
			"${mod}+Down" = "focus down";
			"${mod}+Up" = "focus up";
			"${mod}+Right" = "focus right"; 

			"${mod}+Tab" = "focus mode_toggle; focus next";
			"${mod}+Shift+Tab" = "focus mode_toggle; focus prev";
			#"${mod}+Shift+Tab"= "workspace prev_on_output";
			
			"${mod}+Shift+Left" = "move left";
			"${mod}+Shift+Down" = "move down";
			"${mod}+Shift+Up" = "move up";
			"${mod}+Shift+Right" = "move right";

			"${mod}+Shift+h" = "resize shrink width 10px";
			"${mod}+Shift+j" = "resize grow height 10px";
			"${mod}+Shift+k" = "resize shrink height 10px";
			"${mod}+Shift+l" = "resize grow width 10px";
			#"${mod}+Shift+h" = "resize shrink width 10px";
			#"${mod}+Shift+j" = "resize grow height 10px";
			#"${mod}+Shift+k" = "resize shrink height 10px";
			#"${mod}+Shift+l" = "resize grow width 10px";

			"${mod}+1" = "workspace number 1";
			"${mod}+2" = "workspace number 2";
			"${mod}+3" = "workspace number 3";
			"${mod}+4" = "workspace number 4";
			"${mod}+5" = "workspace number 5";
			"${mod}+6" = "workspace number 6";
			"${mod}+7" = "workspace number 7";
			"${mod}+8" = "workspace number 8";
			"${mod}+9" = "workspace number 9";
			
			"${mod}+Shift+1" = "move container to workspace number 1";
			"${mod}+Shift+2" = "move container to workspace number 2";
			"${mod}+Shift+3" = "move container to workspace number 3";
			"${mod}+Shift+4" = "move container to workspace number 4";
			"${mod}+Shift+5" = "move container to workspace number 5";
			"${mod}+Shift+6" = "move container to workspace number 6";
			"${mod}+Shift+7" = "move container to workspace number 7";
			"${mod}+Shift+8" = "move container to workspace number 8";
			"${mod}+Shift+9" = "move container to workspace number 9";
			
		}; 
	};
}
