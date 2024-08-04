{config, lib, pkgs, ...}:
{
  services.dunst = { 
    enable = true;
    settings = {
      global = {
        transparency = 10;
      };
    };
  };
}