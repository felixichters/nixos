{
  variant = "light";

  sway = {
    wallpaper  = "#c6c6c6";
    background = "#dadada";

    focused = {
      border      = "#5f87af";
      background  = "#5f87af";
      text        = "#dadada";
      indicator   = "#5f87af";
      childBorder = "#5f87af";
    };
    focusedInactive = {
      border      = "#c6c6c6";
      background  = "#c6c6c6";
      text        = "#4e4e4e";
      indicator   = "#c6c6c6";
      childBorder = "#c6c6c6";
    };
    unfocused = {
      border      = "#c6c6c6";
      background  = "#c6c6c6";
      text        = "#4e4e4e";
      indicator   = "#c6c6c6";
      childBorder = "#c6c6c6";
    };
    urgent = {
      border      = "#af5f5f";
      background  = "#af5f5f";
      text        = "#dadada";
      indicator   = "#af5f5f";
      childBorder = "#af5f5f";
    };

    bar = {
      background = "#c6c6c6";
      statusline = "#4e4e4e";
      separator  = "#8a8a8a";
      focusedWorkspace = {
        border     = "#dadada";
        background = "#dadada";
        text       = "#4e4e4e";
      };
      activeWorkspace = {
        border     = "#c6c6c6";
        background = "#c6c6c6";
        text       = "#4e4e4e";
      };
      inactiveWorkspace = {
        border     = "#c6c6c6";
        background = "#c6c6c6";
        text       = "#8a8a8a";
      };
      urgentWorkspace = {
        border     = "#af5f5f";
        background = "#af5f5f";
        text       = "#dadada";
      };
    };
  };

  foot = {
    background          = "#dadada";
    foreground          = "#4e4e4e";
    selectionBackground = "#5f87af";
    selectionForeground = "#dadada";
    color00 = "#4e4e4e";
    color01 = "#af5f5f";
    color02 = "#5f8f5f";
    color03 = "#af8760";
    color04 = "#5f87af";
    color05 = "#875f87";
    color06 = "#5f8787";
    color07 = "#e4e4e4";
    color08 = "#c6c6c6";
    color09 = "#870000";
    color10 = "#005f00";
    color11 = "#d78760";
    color12 = "#0087af";
    color13 = "#870260";
    color14 = "#008787";
    color15 = "#eeeeee";
  };

  mako = {
    background = "#dadada";
    text       = "#4e4e4e";
    border     = "#c6c6c6";
  };

  wmenu = {
    normalBg   = "#5f87af";
    normalFg   = "#3a3a3a";
    selectedBg = "#dadada";
    selectedFg = "#4e4e4e";
  };

  nvim = {
    colorscheme = "seoul256-light";
  };
}
