{ config, lib, pkgs, user, ... }:
{
  options.printing.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "enable printing and scanning";
  };

  config = lib.mkIf config.printing.enable {
    services.printing = {
      enable = true;
      drivers = with pkgs; [ epson-escpr2 cups-filters cups-browsed ];
    };

    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    hardware.sane = {
      enable = true;
      extraBackends = [ pkgs.sane-airscan ];
    };

    users.users.${user.name}.extraGroups = [ "lp" "scanner" ];
  };
}
