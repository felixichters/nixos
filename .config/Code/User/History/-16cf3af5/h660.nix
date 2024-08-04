{config, lib, pkgs, ...}:

{
  programs.fuzzel.enable = true;
  programs.fuzzel.settings = {
    main = {
      font = lib.mkForce "JetBrainsMono:size=11";
    };
  };
  
  services.dunst.enable = true;

  home.packages = with pkgs; [
    
  ];
}