{config, lib, pkgs, ...}:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        #height = 10;
        output = [
          "eDP-1"
          "HDMI-A-1"
        ];
        modules-left = [ "custom/power" "sway/mode" ];
        modules-center = [ "sway/workspaces" ];
        modules-right = ["cpu" "pulseaudio" "backlight" "battery" "network" "clock" ];

        "sway/workspaces" = {
          disable-scroll = true;
          disable-markup = false;
          all-outputs = true;
          format = "{icon}";
          format-icons = {
            #"1" = "";
            #"2" = "";
            #"3" = "";
            #"4" = "";
            #"5" = "";
            focused = "";
            default = "";
          };
          persistent-workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
          };
          tooltip = false;
        };
        "cpu" = {
          interval = 1;
          format = "{icon}";
          format-alt = "{usage}%";
          format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
          tooltip = false;
        };
        "clock" = {
          format-alt = "{:%Y/%m/%d} ";
          format = "{:%H:%M}";
          tooltip = false;
        };
        "battery" = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon}";
          format-alt = "{capacity}%";
          # "format-good" = ""; # An empty format will hide the module
          # "format-full" = "";
          format-icons = [ "" "" "" "" "" ];
          tooltip = false;
        };
        "network" = {
          # "interface" = "wlp2s0"; # (Optional) To force the use of this interface
          format-wifi = "";
          format-alt = "{essid} ({signalStrength}%)";
          format-disconnected = "";
          interval = 7;
          tooltip = false;
        };
        "backlight" = {
          format = "{icon}";
          format-icons = ["" "" "" "" "" "" "" "" "" ""];
          tooltip = false;
        };

        "pulseaudio" = {
          format = "{icon}";
          format-alt = "{volume}%";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "";
          format-icons = {
            headphones = "";
            handsfree = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" ""];
          };
          tooltip = false;
        };

        "custom/power" = {
          format = "";
          on-click = "~/.dotfiles/home/waybar/power.sh";
          tooltip = false; 
        };
      };
    };
    style = ''
      * {
        padding: 0;
        margin: 0;
      }
      .modules-left {
        margin-left: 3px;
        margin-top: 2px;
      }

      .modules-right {
        margin-right: 3px;
        margin-top: 2px;
      }

      window#waybar {
        border: none; 
      }

      .modules-center #workspaces button {
        border-bottom: none;
        padding: 0 0px;
        margin-top: 2px;
      }

      .modules-center #workspaces button.focused,
        .modules-center #workspaces button.active {
        border-bottom: none;
        padding: 0 0px;
        margin-top: 2px;
      }

      #workspaces button:hover {
        box-shadow: inherit;
        text-shadow: inherit;
        background: inherit
      }

      #custom-power,
      #battery,
      #network,
      #backlight,
      #clock,
      #pulseaudio,
      #cpu
      {
        padding: 0 10px;
      }
  '';  
  };

}