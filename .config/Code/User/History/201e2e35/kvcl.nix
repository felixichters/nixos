{config, lib, pkgs, ...}:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$term" = "kitty";
    "$menu" = "fuzzel";
    bind =
      [
        "$mod Shift, Q, exit,"
        "$mod, Q, killactive,"

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