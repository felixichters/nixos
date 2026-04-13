{
  sway = {
    wallpaper  = "#191919";
    background = "#101010";

    focused = {
      border      = "#555555";
      background  = "#555555";
      text        = "#cccccc";
      indicator   = "#555555";
      childBorder = "#555555";
    };
    focusedInactive = {
      border      = "#444444";
      background  = "#444444";
      text        = "#cccccc";
      indicator   = "#444444";
      childBorder = "#444444";
    };
    unfocused = {
      border      = "#101010";
      background  = "#101010";
      text        = "#cccccc";
      indicator   = "#101010";
      childBorder = "#101010";
    };
    urgent = {
      border      = "#d70000";
      background  = "#d70000";
      text        = "#cccccc";
      indicator   = "#d70000";
      childBorder = "#d70000";
    };

    bar = {
      background = "#191919";
      statusline = "#cccccc";
      separator  = "#444444";
      focusedWorkspace = {
        border     = "#2a2a2a";
        background = "#2a2a2a";
        text       = "#deeeed";
      };
      activeWorkspace = {
        border     = "#2a2a2a";
        background = "#191919";
        text       = "#deeeed";
      };
      inactiveWorkspace = {
        border     = "#191919";
        background = "#191919";
        text       = "#7a7a7a";
      };
      urgentWorkspace = {
        border     = "#d70000";
        background = "#d70000";
        text       = "#cccccc";
      };
    };
  };

  kitty = {
    background          = "#101010";
    foreground          = "#cccccc";
    selectionBackground = "#cccccc";
    selectionForeground = "#101010";
    color00 = "#080808";
    color01 = "#d70000";
    color02 = "#789978";
    color03 = "#ffaa88";
    color04 = "#708090";
    color05 = "#789978";
    color06 = "#7788aa";
    color07 = "#dddddd";
    color08 = "#555555";
    color09 = "#ffaa88";
    color10 = "#2a2a2a";
    color11 = "#444444";
    color12 = "#aaaaaa";
    color13 = "#dddddd";
    color14 = "#7788aa";
    color15 = "#deeeed";
  };

  foot = {
    background          = "#101010";
    foreground          = "#cccccc";
    selectionBackground = "#cccccc";
    selectionForeground = "#101010";
    color00 = "#080808";
    color01 = "#d70000";
    color02 = "#789978";
    color03 = "#ffaa88";
    color04 = "#708090";
    color05 = "#789978";
    color06 = "#7788aa";
    color07 = "#dddddd";
    color08 = "#555555";
    color09 = "#ffaa88";
    color10 = "#2a2a2a";
    color11 = "#444444";
    color12 = "#aaaaaa";
    color13 = "#dddddd";
    color14 = "#7788aa";
    color15 = "#deeeed";
  };

  waybar = {
    background = "#191919";  # window/tooltip background
    foreground = "#cccccc";  # text, normal workspaces
    border     = "#444444";  # tooltip border, inactive workspace text
    scratchpad = "#ffaa88";  # scratchpad indicator
    accent     = "#708090";  # ssh, vpn, bluetooth
    critical   = "#d70000";  # errors, disconnected, muted, battery critical
    charging   = "#789978";  # battery charging
  };

  mako = {
    background = "#191919";
    text       = "#cccccc";
    border     = "#2a2a2a";
  };

  tofi = {
    "background-color" = "#000A";
    "text-color"       = "#7a7a7a";
    "selection-color"  = "#7788aa";
    "input-color"      = "#cccccc";
    "prompt-color"     = "#555555";
  };

  nvim = {
    colorscheme = "lackluster";
  };
}
