{config, lib, pkgs, ...}:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$term" = "kitty";
    "$menu" = "fuzzel";
    "$files" = "kitty ranger";
    bind =
      [
        "$mod Shift, Q, exit,"
        "$mod, Q, killactive,"
        
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        XF86MonBrightnessUp = "exec light -A 10";
        XF86MonBrightnessDown = "exec light -U 10";
        "$mod, R, exec, $menu" 
        "$mod, Return, exec, $term"

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
}