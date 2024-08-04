{config, lib, pkgs, ...}:
{
  services.mako = { 
    enable = true;
    borderSize = 0;
    borderRadius = 10;
    ignoreTimeout = true;
    defaultTimeout = 3000;
    backgroundColor = lib.mkForce "#00000000";
    extraConfig = lib.mkForce ''
      [urgency=low]
      background-color=#00000000 
    '';
  };
}