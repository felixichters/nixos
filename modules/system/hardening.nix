{ config, lib, ... }:
{
  options.hardening.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "firewall, polkit, sudo timeout";
  };

  config = lib.mkIf config.hardening.enable {
    security.sudo.extraConfig = ''
      Defaults timestamp_timeout=30
    '';
    networking.firewall.enable = true;
    security.polkit.enable = true;
  };
}
