{ config, host, lib, ... }:
{
  options.networkmanager.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable NetworkManager";
  };

  config = {
    networking.hostName = host;
    networking.networkmanager = {
      enable = config.networkmanager.enable;
      wifi.macAddress = "random";
      wifi.scanRandMacAddress = true;
      ethernet.macAddress = "random";
      connectionConfig = {
        "connection.stable-id" = "\${CONNECTION}/\${BOOT}";
        "ipv4.ignore-auto-dns" = "true";
        "ipv6.ignore-auto-dns" = "true";
      };
    };
  };
}
