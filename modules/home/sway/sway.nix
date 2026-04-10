{config, lib, pkgs, theme, ...}:
let
  swaybarStatus = pkgs.runCommand "swaybar-status" {
    nativeBuildInputs = [ pkgs.gcc ];
  } ''
    mkdir -p $out/bin
    gcc -O3 -s -o $out/bin/swaybar-status ${./swaybar-status.c}
  '';
in
{
  options.sway.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable sway";
  };

  imports = [
    ./keybindings.nix
  ];

  config = lib.mkIf config.sway.enable {
    programs.swaylock.enable = true;
    wayland.windowManager.sway = {
      enable = true;
      xwayland = true;
      config = {
        modifier = "Mod4";
        terminal = "kitty";
        window = {
          titlebar = false;
          border = 2;
          commands = [
            {
              criteria = { app_id = "org.keepassxc.KeePassXC"; };
              command = "floating enable, move position center";
            }
          ];
        };
        gaps = {
          inner = 10;
          smartBorders = "on";
          smartGaps = true;
        };
        input = {
          "*" = {
            xkb_layout = "de";
          };
          "type:touchpad" = {
            natural_scroll = "enabled";
          };
        };
        fonts = {
          names = ["FiraCode Nerd Font"];
          size = 10.0;
        };
        output."*".bg = "${theme.wallpaper} solid_color";
        bars = [{
          statusCommand = "${swaybarStatus}/bin/swaybar-status";
          position = "top";
          fonts = {
            names = [ "FiraCode Nerd Font" ];
            size = 10.0;
          };
          colors = {
            background = theme.background_alt;
            statusline = theme.foreground;
            separator = theme.border_unfocused;
            focusedWorkspace = {
              border = theme.background_alt;
              background = theme.background_alt;
              text = theme.foreground;
            };
            activeWorkspace = {
              border = theme.background_alt;
              background = theme.background_alt;
              text = theme.foreground;
            };
            inactiveWorkspace = {
              border = theme.background_alt;
              background = theme.background_alt;
              text = theme.border_unfocused;
            };
            urgentWorkspace = {
              border = theme.color01;
              background = theme.color01;
              text = theme.foreground;
            };
          };
        }];
        colors = {
          background = theme.background;
          focused = {
            border = theme.border_focused;
            background = theme.border_focused;
            text = theme.foreground;
            indicator = theme.border_focused;
            childBorder = theme.border_focused;
          };
          focusedInactive = {
            border = theme.border_unfocused;
            background = theme.border_unfocused;
            text = theme.foreground;
            indicator = theme.border_unfocused;
            childBorder = theme.border_unfocused;
          };
          unfocused = {
            border = theme.border_unfocused;
            background = theme.border_unfocused;
            text = theme.foreground;
            indicator = theme.border_unfocused;
            childBorder = theme.border_unfocused;
          };
          urgent = {
            border = theme.color01;
            background = theme.color01;
            text = theme.foreground;
            indicator = theme.color01;
            childBorder = theme.color01;
          };
        };
      };
    };
  };
}
