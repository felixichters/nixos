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
        modules-left = [ "custom/power" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = ["disk" "memory" "cpu" "pulseaudio" "backlight" "battery" "network" "clock" ];

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

        "hyprland/workspaces" = {
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
            active = "";
            default = "";
            persistant = "";
          };
          persistent-workspaces = {
            "1" = [];
          };
          tooltip = false;
        };
        "cpu" = {
          interval = 1;
          format = "{icon}";
          format-alt = "CPU {usage}%";
          format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
          tooltip = false;
        };
        "clock" = {
          format-alt = "{:%Y/%m/%d}";
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
        "memory" = {
          format = "{icon}";
          format-alt= "RAM {}%";
          format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
          tooltip = false;
        };

        "disk" = {
          format = " ";
          format-alt = "{used} / {total}";
          tooltip = false;
        };


        "pulseaudio" = {
          format = "{icon}";
          format-alt = "{volume}%";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "";
          format-icons = {
            headphones = "";
            default = ["" ""];
          };
          tooltip = false;
          states = {

          };
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
      }

      .modules-right {
        margin-right: 3px;
      }

      window#waybar {
        border: none; 
      }

      .modules-center #workspaces button {
        border-bottom: none;
        padding: 0 0px;
      }

      .modules-center #workspaces button.focused,
        .modules-center #workspaces button.active {
        border-bottom: none;
        padding: 0 0px;
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