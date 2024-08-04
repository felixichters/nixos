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



  home.file.".config/rofi/config.rasi".text = ''
  # Write your configuration

  # String interpolation to get the store path
  @import "${pkgs.rofi-unwrapped}/share/rofi/themes/name-of-theme.rasi"
'';
}
