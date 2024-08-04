{config, lib, pkgs, ...}:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
				#height = 5;
        output = [
          "eDP-1"
          "HDMI-A-1"
        ];
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "backlight" "pulseaudio" "battery" "network" "clock" ];

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
            #"5" = "";
            focused = "";
            default = "";
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
          active-only = true;
          all-outputs = true;
          show_special = true;
          format = "{icon}";
          format-icons = {
            #"1" = "";
            #"2" = "";
            #"3" = "";
            #"4" = "";
            #"5" = "";
            #"9" = "";
            special = "";
            active = "  ";
            default = "  ";
            #persistant = "";
          };
          persistent-workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
						#"4" = [];
            #"9" =  [];
          };
          tooltip = false;
        };
				"hyprland/window" = {
					format = "{initialTitle}"; 
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
          on-click = "~/.config/rofi/powermenu/type-4/powermenu.sh";
          tooltip = false; 
        };
      };
    };
  };
}
