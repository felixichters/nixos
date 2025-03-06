{config, lib, pkgs, ...}:

{
	config = lib.mkIf config.hyprland.enable {
		wayland.windowManager.hyprland.settings = {
			"$mod" = "SUPER";
			"$term" = "kitty";
			#"$menu" = "./.config/rofi/launchers/type-1/launcher.sh";
			#"$menu" = "fuzzel -B 0 -a center";
			"$files" = "kitty ranger";
			bindm = [
				"$mod, mouse:272, movewindow"
				"$mod, mouse:273, resizewindowpixel"
			];
			binde = [
				", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
				", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
				", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"     
				", XF86MonBrightnessUp, exec, light -A 10"
				", XF86MonBrightnessDown, exec, light -U 10"
				
				"$mod, h, resizeactive, -10 0"
				"$mod, l, resizeactive, 10 0"
				"$mod, k, resizeactive, 0 -10"
				"$mod, j, resizeactive, 0 10"


			];
			bind = [
				"$mod Shift, Q, exit,"
				"$mod, Q, killactive,"
				"$mod, b, exec, hyprctl keyword monitor eDP-1,disable"
				"$mod Shift, b, exec, hyprctl keyword monitor eDP-1,preferred"
				#"$mod, R, exec, $menu" 
				"$mod, Return, exec, $term"
				"$mod, E, exec, $files"

				#"$mod, o, overview:toggle,"

				"$mod, F, exec, ./.dotfiles/home/hyprland/waybar.sh "
				
				"$mod, escape, exec, swaylock -C ~/.dotfiles/home/hyprland/swaylock --screenshots --clock --effect-blur 9x9 --fade-in 0.2"  

				"$mod, P, exec, ~/.config/rofi/powermenu/type-2/powermenu.sh"

				"$mod, Tab, cyclenext,"
				"$mod, Tab, bringactivetotop,"

				"$mod, SPACE, togglefloating," 
				
				"$mod Shift, h, movewindow, l"
				"$mod Shift, l, movewindow, r"
				"$mod Shift, k, movewindow, u"
				"$mod Shift, j, movewindow, d"

				"$mod, S, togglespecialworkspace, magic"
				"$mod, S, movetoworkspace, +0"
				"$mod, S, togglespecialworkspace, magic"
				"$mod, S, movetoworkspace, special:magic"
				"$mod, S, togglespecialworkspace, magic"
				]
				++ (
					builtins.concatLists (builtins.genList (
							x: let
								ws = let
									c = (x + 1) / 10;
								in
									builtins.toString (x + 1 - (c * 10));
							in [
								"$mod, ${ws}, workspace, ${toString (x + 1)}"
								"$mod SHIFT, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
							]
						)
						10)
				);
		};
	};
}
