{ config, lib, pkgs, ... }:
{
  options.nettools.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "network analysis and VPN client tools";
  };

  config = lib.mkIf config.nettools.enable {
    home.packages = with pkgs; [
      nmap
      netcat-gnu
      tcpdump
      bettercap
      openvpn
      openconnect
      networkmanager-openconnect
      networkmanagerapplet
    ];
  };
}
