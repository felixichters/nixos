{config, lib, pkgs, theme, font, ...}:
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
          statusCommand = "${swaybarStatus}/bin/swaybar-status";
          position = "top";
          fonts = {
            names = [ font.name ];
            size = 10.0;
          };
          colors = {
            background = theme.sway.bar.background;
            statusline = theme.sway.bar.statusline;
            separator  = theme.sway.bar.separator;
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
  };
}
