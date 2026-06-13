{ pkgs, ... }:
{
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
}
