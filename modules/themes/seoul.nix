{
  sway = {
    wallpaper  = "#5f865f";
    background = "#3a3a3a";

    focused = {
      border      = "#85add4";
      background  = "#85add4";
      text        = "#d0d0d0";
      indicator   = "#85add4";
      childBorder = "#85add4";
    };
    focusedInactive = {
      border      = "#4d4d4d";
      background  = "#4d4d4d";
      text        = "#d0d0d0";
      indicator   = "#4d4d4d";
      childBorder = "#4d4d4d";
    };
    unfocused = {
      border      = "#4d4d4d";
      background  = "#4d4d4d";
      text        = "#d0d0d0";
      indicator   = "#4d4d4d";
      childBorder = "#4d4d4d";
    };
    urgent = {
      border      = "#d68686";
      background  = "#d68686";
      text        = "#d0d0d0";
      indicator   = "#d68686";
      childBorder = "#d68686";
    };

    bar = {
      background = "#4d4d4d";
      statusline = "#d0d0d0";
      separator  = "#626262";
      focusedWorkspace = {
        border     = "#3a3a3a";
        background = "#3a3a3a";
        text       = "#d0d0d0";
      };
      activeWorkspace = {
        border     = "#4d4d4d";
        background = "#4d4d4d";
        text       = "#d0d0d0";
      };
      inactiveWorkspace = {
        border     = "#4d4d4d";
        background = "#4d4d4d";
        text       = "#626262";
      };
      urgentWorkspace = {
        border     = "#d68686";
        background = "#d68686";
        text       = "#d0d0d0";
      };
    };
  };

  kitty = {
    background          = "#3a3a3a";
    foreground          = "#d0d0d0";
    selectionBackground = "#005f5f";
    selectionForeground = "#d0d0d0";
    color00 = "#4d4d4d";
    color01 = "#d68686";
    color02 = "#5f8660";
    color03 = "#d7af60";
    color04 = "#85add4";
    color05 = "#d7afaf";
    color06 = "#87afaf";
    color07 = "#d0d0d0";
    color08 = "#626262";
    color09 = "#d76087";
    color10 = "#87af87";
    color11 = "#ffd787";
    color12 = "#add4fb";
    color13 = "#ffafaf";
    color14 = "#87d7d7";
    color15 = "#e4e4e4";
  };

  foot = {
    background          = "#3a3a3a";
    foreground          = "#d0d0d0";
    selectionBackground = "#005f5f";
    selectionForeground = "#d0d0d0";
    color00 = "#4d4d4d";
    color01 = "#d68686";
    color02 = "#5f8660";
    color03 = "#d7af60";
    color04 = "#85add4";
    color05 = "#d7afaf";
    color06 = "#87afaf";
    color07 = "#d0d0d0";
    color08 = "#626262";
    color09 = "#d76087";
    color10 = "#87af87";
    color11 = "#ffd787";
    color12 = "#add4fb";
    color13 = "#ffafaf";
    color14 = "#87d7d7";
    color15 = "#e4e4e4";
  };

  waybar = {
    background = "#4d4d4d";
    foreground = "#d0d0d0";
    border     = "#626262";
    scratchpad = "#d7af60";  # yellow
    accent     = "#85add4";  # blue
    critical   = "#d68686";  # red
    charging   = "#5f8660";  # green
  };

  mako = {
    background = "#4d4d4d";
    text       = "#d0d0d0";
    border     = "#3a3a3a";
  };

  wmenu = {
    normalBg   = "#4d4d4d";
    normalFg   = "#d0d0d0";
    selectedBg = "#85add4";
    selectedFg = "#3a3a3a";
  };

  nvim = {
    colorscheme = "seoul256";
  };
}
