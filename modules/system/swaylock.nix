{ config, lib, ... }:
{
  options.swaylock.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "PAM service entry so swaylock can authenticate";
  };

  config = lib.mkIf config.swaylock.enable {
    security.pam.services.swaylock = { };
  };
}
