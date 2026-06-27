{
  variant = "seoul256-dark";

  sway = {
    wallpaper  = "#3a3a3a";
    background = "#4e4e4e";

    focused = {
      border      = "#d0d0d0";
      background  = "#d0d0d0";
      text        = "#e4e4e4";
      indicator   = "#85add4";
      childBorder = "#d0d0d0";
    };
    focusedInactive = {
      border      = "#d0d0d0";
      background  = "#d0d0d0";
      text        = "#e4e4e4";
      indicator   = "#d0d0d0";
      childBorder = "#d0d0d0";
    };
    unfocused = {
      border      = "#626262";
      background  = "#626262";
      text        = "#626262";
      indicator   = "#626262";
      childBorder = "#626262";
    };
    urgent = {
      border      = "#d68787";
      background  = "#d68787";
      text        = "#d68787";
      indicator   = "#d68787";
      childBorder = "#d68787";
    };

    bar = {
      background      = "#3a3a3a";
      background-alt = "#626262";
      statusline-alt = "#d0d0d0";
      statusline = "#d0d0d0";
      separator  = "#d0d0d0";
      good     = "#5f865f";
      warning  = "#d7afaf";
      critical = "#d68787";
      focusedWorkspace = {
        border     = "#85add4";
        background = "#85add4";
        text       = "#3a3a3a";
      };
      activeWorkspace = {
        border     = "#85add4";
        background = "#3a3a3a";
        text       = "#d0d0d0";
      };
      inactiveWorkspace = {
        border     = "#3a3a3a";
        background = "#3a3a3a";
        text       = "#d0d0d0";
      };
      urgentWorkspace = {
        border     = "#d68787";
        background = "#3a3a3a";
        text       = "#d0d0d0";
      };
    };
  };

  foot = {
    background          = "#4e4e4e";
    foreground          = "#d0d0d0";
    selectionBackground = "#d0d0d0";
    selectionForeground = "#4e4e4e";
    color00 = "#3a3a3a";
    color01 = "#d68787";
    color02 = "#5f865f";
    color03 = "#d8af5f";
    color04 = "#85add4";
    color05 = "#d7afaf";
    color06 = "#87afaf";
    color07 = "#d0d0d0";
    color08 = "#626262";
    color09 = "#d75f87";
    color10 = "#87af87";
    color11 = "#ffd787";
    color12 = "#add4fb";
    color13 = "#ffafaf";
    color14 = "#87d7d7";
    color15 = "#e4e4e4";
  };

  mako = {
    background = "#3a3a3a";
    text       = "#d0d0d0";
    border     = "#3a3a3a";
  };
  
  nvim = {
    colorscheme = "seoul256";
  };
}
