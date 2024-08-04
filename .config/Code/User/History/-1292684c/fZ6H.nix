{config, lib, pkgs, ...}:

{
  imports = [
		./keybindings.nix
	];
  #gtk.enable = true;
  home.packages = with pkgs; [
    autotiling
    rofi
  ];
  wayland.windowManager.sway = {
    enable = true;
    #wrapperFeatures.gtk = true;
    extraConfig = ''
      default_border pixel 2
      exec_always autotiling -w 1 2 3
    '';
    
    config = rec {
      input = {
        "*" = {
          xkb_layout = "de";
        };
        "type:touchpad" = {
          natural_scroll = "enabled";
        };
      };
      
      modifier = "Mod4";
      floating.modifier = "Mod4";
      terminal = "kitty";

      gaps = {
        smartGaps = true;
        smartBorders = "on";
        inner = 12;
      };
      bars = [{
        "command" = "${pkgs.waybar}/bin/waybar";
      }]; 
        
    };
  };

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        output = [
          "eDP-1"
          "HDMI-A-1"
        ];
        modules-left = [ "sway/workspaces" "sway/mode" "wlr/taskbar" ];
        modules-center = [ "sway/window" ];
        modules-right = [ "backlight" "battery" "cpu" "network" "clock" ];

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
        };
        "cpu" = {
          format = "{usage}%  CPU";
        };
        "clock" = {
          format-alt = "{:%Y/%m/%d} ";
          format = "{:%H:%M} ";
        };
        "battery" = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          # "format-good" = ""; # An empty format will hide the module
          # "format-full" = "";
          format-icons = [ "" "" "" "" "" ];
        };
        "network" = {
          # "interface" = "wlp2s0"; # (Optional) To force the use of this interface
          "format-wifi" = "{essid} ({signalStrength}%) ";
          "format-ethernet" = "{ifname} = {ipaddr}/{cidr} ";
          "format-disconnected" = "Disconnected ⚠";
          "interval" = 7;
        };
      };
    };
    style = ''
      * {
        border: none;
      }
      #workspaces button.focused {
        border-bottom: none;
      }
  '';
  };

}
