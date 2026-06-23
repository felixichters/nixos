{ theme, font, ... }:
{
  programs.i3status-rust = {
    enable = true;
    bars.default = {
      settings = {
        theme = {
          theme = "plain";
          overrides = {
            idle_bg     = theme.sway.bar.background;
            idle_fg     = theme.sway.bar.statusline;
            info_bg     = theme.sway.bar.background;
            info_fg     = theme.sway.bar.statusline;
            good_bg     = theme.sway.bar.background;
            good_fg     = theme.sway.bar.statusline;
            warning_bg  = theme.sway.bar.background;
            warning_fg  = theme.sway.bar.statusline;
            critical_bg = theme.sway.bar.background;
            critical_fg = theme.sway.bar.statusline;
            separator_bg = theme.sway.bar.background;
            separator_fg = theme.sway.bar.statusline;
          };
        };
        icons.icons = "none";
      };

      blocks = [
        {
          block = "focused_window";
          format = " $title ";
          theme_overrides = {
            idle_bg = theme.sway.bar.focusedWorkspace.background;
            idle_fg = theme.sway.bar.focusedWorkspace.text;
          };
        }
        {
          block = "custom";
          command = "swaymsg -t get_tree | jq --raw-output '(recurse(.nodes[]) | select(.name == \"__i3_scratch\") | .focus) as $ids | [.. | (.nodes? + .floating_nodes?) // empty | .[] | select(.id | IN($ids[]))] | if length > 0 then \"▁[\\(length)]\" else empty end'";
          interval = 3;
          hide_when_empty = true;
          theme_overrides = {
            idle_bg = theme.sway.bar.focusedWorkspace.background;
            idle_fg = theme.sway.bar.focusedWorkspace.text;
          };
        }
        {
          block = "custom";
          command = "ss -tnH state established '( sport = :22 or dport = :22 )' | grep -q . && printf '[SSH]'; true";
          interval = 5;
          hide_when_empty = true;
        }
        {
          block = "custom";
          command = "ls /sys/class/net | grep -qE '^(tun|wg|vpn|tailscale)' && printf '[VPN]'; true";
          interval = 5;
          hide_when_empty = true;
        }
        {
          block = "net";
          format = " {[W: $ip@$ssid]|[E: $ip]} ";
          interval = 5;
        }
        {
          block = "disk_space";
          path = "/";
          format = " /: $used.eng(w:2)/$total.eng(w:2) ";
          interval = 30;
        }
        {
          block = "memory";
          format = " RAM: $mem_used.eng(w:2)/$mem_total.eng(w:2) ";
          interval = 5;
        }
        {
          block = "cpu";
          format = " CPU: $utilization ";
          interval = 2;
        }
        {
          block = "battery";
          format = " BAT: $percentage ";
          interval = 30;
        }
        {
          block = "time";
          format = " $timestamp.datetime(f:'%d/%m/%Y %H:%M') ";
          interval = 60;
        }
      ];
    };
  };
}
