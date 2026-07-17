{ pkgs, theme, font, ... }:
{
  imports = [
    ./keybindings.nix
  ];

  programs.swaylock.enable = true;
  services.playerctld.enable = true;
  home.packages = with pkgs; [ 
    wl-clipboard 
    grim 
    slurp 
    sway-contrib.grimshot
  ];
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
          xkb_layout = "us,de";
          xkb_options = "caps:swapescape";
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
      bars = [{
        position = "top";
        statusCommand =
          "i3status-rs ~/.config/i3status-rust/config-default.toml";
        fonts = { names = [font.name]; size = 9.0; };
        extraConfig = "height 22";
        trayOutput = "none";
        colors = {
          background        = theme.sway.bar.background;
          statusline        = theme.sway.bar.statusline;
          separator         = theme.sway.bar.separator;
          focusedWorkspace  = theme.sway.bar.focusedWorkspace;
          activeWorkspace   = theme.sway.bar.activeWorkspace;
          inactiveWorkspace = theme.sway.bar.inactiveWorkspace;
          urgentWorkspace   = theme.sway.bar.urgentWorkspace;
        };
      }];
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
