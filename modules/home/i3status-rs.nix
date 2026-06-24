{ theme, font, ... }:
{
  programs.i3status-rust = {
    enable = true;
    bars.default = {
      settings = {
        theme = {
          theme = "plain";
          overrides = {
            idle_bg      = theme.sway.bar.background;
            idle_fg      = theme.sway.bar.statusline;
            info_bg      = theme.sway.bar.background;
            info_fg      = theme.sway.bar.statusline;
            good_bg      = theme.sway.bar.background;
            good_fg      = theme.sway.bar.statusline;
            warning_bg   = theme.sway.bar.background;
            warning_fg   = theme.sway.bar.statusline;
            critical_bg  = theme.sway.bar.background;
            critical_fg  = theme.sway.bar.statusline;
            separator_bg = theme.sway.bar.background;
            separator_fg = theme.sway.bar.statusline;
            separator    = "";
          };
        };
        icons.icons = "none";
      };

      blocks = [
        {
          block = "scratchpad";
          format = "{ _$count.eng(range:1..) |}";
        }
        {
          block = "custom";
          command = "ss -tnH state established '( sport = :22 or dport = :22 )' | grep -q . && printf '[SSH]'; true";
          hide_when_empty = true;
        }
        {
          block = "custom";
          command = "ls /sys/class/net | grep -qE '^(tun|wg|vpn|tailscale)' && printf '[VPN]'; true";
          hide_when_empty = true;
        }
        {
          block = "net";
          format = " {[W: $ip@$ssid]|[E: $ip]} ";
          inactive_format = " Down ";
          missing_format = " x ";
        }
        {
          block = "disk_space";
          path = "/";
          format = " /: $used.eng(w:2)/$total.eng(w:2) ";
        }
        {
          block = "memory";
          format = " RAM:$mem_used.eng(prefix:Mi)/$mem_total.eng(prefix:Mi)($mem_used_percents.eng(w:2)) ";
        }
        {
          block = "cpu";
          format = " CPU:$utilization ";
        }
        {
          block = "sound";
          format = " VOL:{$volume.eng(w:2)|} ";
        }
        {
          block = "backlight";
          format = " BKL:$brightness ";
          missing_format = "";
        }
        {
          block = "battery";
          format = " BAT: $percentage ";
          device = "^BAT[0-9]$";
          missing_format = "";
        }
        {
          block = "time";
          format = " $timestamp.datetime(f:'%d/%m/%Y %H:%M') ";
          theme_overrides = {
            idle_bg = theme.sway.bar.background-alt;
          };
        }
      ];
    };
  };
}
