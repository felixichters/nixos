{ config, lib, theme, font, ... }:

{
  options.kitty.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "enable kitty";
  };

  config = lib.mkIf config.kitty.enable {
    programs.kitty = {
      enable = true;
      font = {
        name = font.name;
        size = 11;
      };
      settings = {
        enable_audio_bell = false;
        confirm_os_window_close = 0;
        window_padding_width = 8;
        mouse_hide_wait = "-1.0";
        cursor_shape = "block";
        cursor_shape_unfocused = "hollow";
        cursor_blink_interval = "-1";
        cursor_stop_blinking_after = "0";
        cursor_trail = "1";
        cursor_trail_decay = "0.1 0.2";
        cursor_trail_start_threshold = "2";
        clear_all_shortcuts = "yes";
      };
      keybindings = {
        "ctrl+c" = "copy_and_clear_or_interrupt";
        "ctrl+shift+c" = "copy_to_clipboard";
        "ctrl+shift+v" = "paste_from_clipboard";

        "ctrl+shift+up" = "scroll_line_up";
        "ctrl+shift+k" = "scroll_line_up";
        "ctrl+shift+down" = "scroll_line_down";
        "ctrl+shift+j" = "scroll_line_down";
      };
      shellIntegration.mode = "no-cursor";
      shellIntegration.enableZshIntegration = true;
      extraConfig = ''
        background ${theme.kitty.background}
        foreground ${theme.kitty.foreground}
        selection_background ${theme.kitty.selectionBackground}
        selection_foreground ${theme.kitty.selectionForeground}
        cursor none

        # normal
        color0 ${theme.kitty.color00}
        color1 ${theme.kitty.color01}
        color2 ${theme.kitty.color02}
        color3 ${theme.kitty.color03}
        color4 ${theme.kitty.color04}
        color5 ${theme.kitty.color05}
        color6 ${theme.kitty.color06}
        color7 ${theme.kitty.color07}

        # bright
        color8 ${theme.kitty.color08}
        color9 ${theme.kitty.color09}
        color10 ${theme.kitty.color10}
        color11 ${theme.kitty.color11}
        color12 ${theme.kitty.color12}
        color13 ${theme.kitty.color13}
        color14 ${theme.kitty.color14}
        color15 ${theme.kitty.color15}
      '';
    };
  };
}
