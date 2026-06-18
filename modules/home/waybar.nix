{ theme, font, ... }:
{
  programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      position = "top";
      #height = 27;
      spacing = 0;
      modules-left = [ "sway/workspaces" "custom/scratchpad" ];
      modules-right = [
        "custom/vpn"
        "custom/ssh"
        "network"
        "disk"
        "memory"
        "cpu"
        "battery"
        "clock"
      ];

      "sway/workspaces" = {
        format = "{icon} {name}";
        format-icons = {
          default = "▂";
          focused = "█";
          urgent = "▀";
        };
        disable-scroll = true;
      };

      "custom/scratchpad" = {
        interval = 3;
        return-type = "json";
        exec = "swaymsg -t get_tree | jq --unbuffered --compact-output '(recurse(.nodes[]) | select(.name == \"__i3_scratch\") | .focus) as $scratch_ids | [.. | (.nodes? + .floating_nodes?) // empty | .[] | select(.id |IN($scratch_ids[]))] as $scratch_nodes | if ($scratch_nodes|length) > 0 then { text: \"\\($scratch_nodes | length)\" } else empty end'";
        format = "▁[{}]";
        on-click = "swaymsg 'scratchpad show'";
        tooltip = false;
      };

      "custom/vpn" = {
        format = "[VPN]";
        exec = "echo";
        exec-if = "ls /sys/class/net | grep -qE '^(tun|wg|vpn|tailscale)'";
        interval = 5;
        tooltip = false;
      };

      "custom/ssh" = {
        format = "[SSH]";
        exec = "echo";
        exec-if = "ss -tnH state established '( sport = :22 or dport = :22 )' | grep -q .";
        interval = 5;
        tooltip = false;
      };

      "network" = {
        format-wifi = "[W: {ipaddr}@{essid}]";
        format-ethernet = "[E: {ipaddr}]";
        format-disconnected = "[!]";
        interval = 5;
        tooltip = false;
      };

      "disk" = {
        format = "/: {used}/{total}";
        interval = 30;
        path = "/";
        tooltip = false;
      };

      "memory" = {
        format = "RAM: {used:.1f}G/{total:.1f}G";
        interval = 5;
        tooltip = false;
      };

      "cpu" = {
        format = "CPU: {usage}%";
        interval = 2;
        tooltip = false;
      };

      "battery" = {
        format = "BAT: +{capacity}%";
        format-discharging = "BAT: -{capacity}%";
        interval = 30;
        tooltip = false;
      };

      "clock" = {
        format = "{:%d/%m/%Y %H:%M}";
        interval = 60;
        tooltip = false;
      };
    }];

    style = ''
      * {
        font-family: "${font.name}";
        font-size: 9pt;
        border-radius: 0;
        min-height: 25px;
        border: none;
        color: ${theme.sway.bar.statusline};
        background: ${theme.sway.bar.background};
        box-shadow: none;
        text-shadow: none;
        border: none;
        transition: none;
      }
      
      #workspaces button {
        padding: 0 4px;
      }
      
      #custom-scratchpad {
        padding: 0 7px;
      }
      
      #custom-vpn,
      #custom-ssh,
      #network,
      #disk,
      #memory,
      #cpu,
      #battery,
      #clock {
        padding: 0 8px;
      }
    '';
  };
}
