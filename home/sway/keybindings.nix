{config, lib, pkgs, ...}:

let
  mod = "Mod4";
  term = "kitty";
  menu = "fuzzel -r 0";
  files = "kitty ranger";
in
{
  wayland.windowManager.sway.config.keybindings = {
    
    XF86AudioMute = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    XF86AudioRaiseVolume = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
    XF86AudioLowerVolume = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
    XF86MonBrightnessUp = "exec light -A 10";
    XF86MonBrightnessDown = "exec light -U 10";
  
    "${mod}+Shift+r" = "reload";
    "${mod}+Shift+q" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";
    "${mod}+Shift+e" = "exec swaylock";

    "${mod}+Return" = "exec ${term}";
    "${mod}+q" = "kill";
    "${mod}+r" = "exec ${menu}";
    "${mod}+e" = "exec ${files}";

    "${mod}+minus" = "exec swaymsg move scratchpad";
    "${mod}+plus" = "exec swaymsg scratchpad show";
    "${mod}+Shift+plus" = "floating toggle";
    "${mod}+f" = "fullscreen";

    "${mod}+h" = "focus left";
    "${mod}+j" = "focus down";
    "${mod}+k" = "focus up";
    "${mod}+l" = "focus right"; 

    "${mod}+Tab" = "focus right";
    "Alt+Tab" = "focus right";

    "${mod}+Shift+h" = "move left";
    "${mod}+Shift+j" = "move down";
    "${mod}+Shift+k" = "move up";
    "${mod}+Shift+l" = "move right";

    "${mod}+Left" = "resize shrink width 10px";
    "${mod}+Down" = "resize grow height 10px";
    "${mod}+Up" = "resize shrink height 10px";
    "${mod}+Right" = "resize grow width 10px";

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
}