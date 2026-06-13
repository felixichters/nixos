{ host, ... }:
{
  networking.hostName = host;
  networking.networkmanager = {
    enable = true;
    wifi.macAddress = "random";
    wifi.scanRandMacAddress = true;
    ethernet.macAddress = "random";
    connectionConfig = {
      "connection.stable-id" = "\${CONNECTION}/\${BOOT}";
    };
  };
}
