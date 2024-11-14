{config, lib, pkgs, ...}:
{
  services.mako = { 
    enable = true;
    borderSize = 2;
    borderRadius = 0;
    ignoreTimeout = true;
    defaultTimeout = 3000;
  };
}
