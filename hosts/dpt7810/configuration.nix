{ lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
    ../../modules/system/gaming.nix
    ../../modules/system/nvidia.nix
  ];
  system.stateVersion = "24.11";

  systemd.services.NetworkManager = {
    after = lib.mkAfter [ "sys-subsystem-net-devices-wlp0s20u8i2.device" ];
    wants = [ "sys-subsystem-net-devices-wlp0s20u8i2.device" ];
  };
}
