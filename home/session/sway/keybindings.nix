{config, lib, pkgs, ...}:

let
  mod = "Mod4";
  term = "kitty";
  menu = "tofi-run | xargs swaymsg exec --";
  files = "kitty ranger";
	power = "~/.config/rofi/powermenu/type-2/powermenu.sh";
	lock = "swaylock -C ~/.dotfiles/home/hyprland/swaylock --screenshots --clock --effect-blur 9x9 --fade-in 0.2";  
in
{

	config = lib.mkIf config.sway.enable {

		wayland.windowManager.sway.config.keybindings = {
			
			XF86AudioMute = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
			XF86AudioRaiseVolume = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
			XF86AudioLowerVolume = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
			XF86MonBrightnessUp = "exec light -A 10";
			XF86MonBrightnessDown = "exec light -U 10";
		
			"${mod}+Shift+r" = "reload";
			"${mod}+Shift+q" = "exec swaynag -t warning -m 'exit sway?' -B 'Yes, exit sway' 'swaymsg exit'";
			"${mod}+Shift+e" = "exec ${lock}";

			"${mod}+Return" = "exec ${term}";
			"${mod}+q" = "kill";
			"${mod}+r" = "exec ${menu}";
			"${mod}+e" = "exec ${files}";
			"${mod}+p" = "exec ${power}";
			"${mod}+minus" = "exec swaymsg move scratchpad";
			"${mod}+plus" = "exec swaymsg scratchpad show";
			"${mod}+Shift+space" = "floating toggle";
			"${mod}+f" = "fullscreen";

			"${mod}+h" = "focus left";
			"${mod}+j" = "focus down";
			"${mod}+k" = "focus up";
			"${mod}+l" = "focus right"; 
			"${mod}+Left" = "focus left";
			"${mod}+Down" = "focus down";
			"${mod}+Up" = "focus up";
			"${mod}+Right" = "focus right"; 

			#"${mod}+Tab" = "focus right";
			#"${mod}+Shift+Tab" = "focus left";
			"${mod}+Tab"= "workspace next_on_output";
			"${mod}+Shift+Tab"= "workspace prev_on_output";
			
			"${mod}+Shift+h" = "move left";
			"${mod}+Shift+j" = "move down";
			"${mod}+Shift+k" = "move up";
			"${mod}+Shift+l" = "move right";

			"${mod}+Shift+Left" = "resize shrink width 10px";
			"${mod}+Shift+Down" = "resize grow height 10px";
			"${mod}+Shift+Up" = "resize shrink height 10px";
			"${mod}+Shift+Right" = "resize grow width 10px";
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
