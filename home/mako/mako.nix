{config, lib, pkgs, ...}:
{
  services.mako = { 
    enable = true;
    borderSize = 0;
    borderRadius = 15;
    ignoreTimeout = true;
    defaultTimeout = 3000;
  };
}
