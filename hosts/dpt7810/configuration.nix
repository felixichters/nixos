{ lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];
  system.stateVersion = "24.11";

  # USB WiFi adapter (wlp0s20u8i2) enumerates after NetworkManager starts;
  # delay NM until the device unit appears so WiFi is available without a manual restart.
  systemd.services.NetworkManager = {
    after = lib.mkAfter [ "sys-subsystem-net-devices-wlp0s20u8i2.device" ];
    wants = [ "sys-subsystem-net-devices-wlp0s20u8i2.device" ];
  };
}
