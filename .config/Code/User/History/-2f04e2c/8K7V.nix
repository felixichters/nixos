{config, lib, pkgs, ...}:

{
  programs.ranger = {
    enable = true;
  };
  xdg.configFile."ranger/rifle.conf".text = ''
    
  '';
}