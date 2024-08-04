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
  };
  };
  home.packages = with pkgs; [
    
  ];
}