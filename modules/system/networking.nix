{ config, host, lib, ... }:
{
  options.networkmanager.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable NetworkManager";
  };

  config = {
    networking.hostName = host;
    networking.networkmanager.enable = config.networkmanager.enable;
  };
}
