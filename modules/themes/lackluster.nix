{
  variant = "dark";

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
      border      = "#2a2a2a";
      background  = "#2a2a2a";
      text        = "#cccccc";
      indicator   = "#2a2a2a";
      childBorder = "#2a2a2a";
    };
    urgent = {
      border      = "#7788aa";
      background  = "#7788aa";
      text        = "#cccccc";
      indicator   = "#7788aa";
      childBorder = "#7788aa";
    };

    bar = {
      background = "#191919";
      statusline = "#cccccc";
      separator  = "#444444";
      scratch    = "#aaaaaa";
      focusedWorkspace = {
        border     = "#708090";
        background = "#708090";
        text       = "#cccccc";
      };
      activeWorkspace = {
        border     = "#2a2a2a";
        background = "#2a2a2a";
        text       = "#cccccc";
      };
      inactiveWorkspace = {
        border     = "#191919";
        background = "#191919";
        text       = "#7a7a7a";
      };
      urgentWorkspace = {
        border     = "#2a2a2a";
        background = "#2a2a2a";
        text       = "#deeeed";
      };
    };
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

  mako = {
    background = "#191919";
    text       = "#cccccc";
    border     = "#2a2a2a";
  };

  wmenu = {
    normalBg   = "#708090";
    normalFg   = "#2a2a2a";
    selectedBg = "#aaaaaa";
    selectedFg = "#080808";
  };

  nvim = {
    colorscheme = "lackluster";
  };
}
