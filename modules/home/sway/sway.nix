{ pkgs, theme, font, ... }:
{
  imports = [
    ./keybindings.nix
  ];

  programs.swaylock.enable = true;
  services.playerctld.enable = true;
  home.packages = with pkgs; [ wl-clipboard grim slurp sway-contrib.grimshot ];
  wayland.windowManager.sway = {
    enable = true;
    xwayland = true;
    config = {
      modifier = "Mod4";
      terminal = "kitty";
      window = {
        titlebar = false;
        border = 1;
        commands = [
          {
            criteria = { app_id = "org.keepassxc.KeePassXC"; };
            command = "floating enable, move position center";
          }
        ];
      };
      gaps = {
        inner = 0;
        smartBorders = "on";
        #smartGaps = true;
      };
      input = {
        "*" = {
          xkb_layout = "de";
          xkb_options = "caps:escape";
        };
        "type:touchpad" = {
          natural_scroll = "enabled";
        };
      };
      fonts = {
        names = [font.name];
        size = 10.0;
      };
      output."*".bg = "${theme.sway.wallpaper} solid_color";
      bars = [{command = "${pkgs.waybar}/bin/waybar";}];
      colors = {
        background      = theme.sway.background;
        focused         = theme.sway.focused;
        focusedInactive = theme.sway.focusedInactive;
        unfocused       = theme.sway.unfocused;
        urgent          = theme.sway.urgent;
      };
    };
  };
}
