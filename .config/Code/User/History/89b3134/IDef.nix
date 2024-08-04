{config, lib, pkgs, ...}:
{
  services.mako = { 
    enable = true;
    borderSize = 0;
    borderRadius = 10;
  };
}