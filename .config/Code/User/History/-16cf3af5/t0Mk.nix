{config, lib, pkgs, ...}:

{
  programs.fuzzel.enable = true;
  programs.fuzzel.settings = {
    main = {
      font = lib.mkForce "JetBrainsMono:size=11";
    };
  };
  services.dunst.enable = true;
  services.dunst.settings = 
  {
  global = {
    width = 300;
    height = 300;
    offset = "30x50";
    origin = "top-right";
    transparency = 10;
    frame_color = "#eceff1";
    font = "Droid Sans 9";
  };

  urgency_normal = {
    background = "#37474f";
    foreground = "#eceff1";
    timeout = 10;
  };
  };
  home.packages = with pkgs; [
    
  ];
}