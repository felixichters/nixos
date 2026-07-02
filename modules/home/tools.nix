{ pkgs, ... }:
{
  programs.feh.enable = true;
  programs.fzf.enable = true;
  programs.jq.enable = true;
  programs.tmux.enable = true;
  programs.bat.enable = true;
  home.packages = with pkgs; [
    ghostscript
    cmatrix
    zip
    unzip
    xdg-utils
    p7zip
    wget
    usbutils
    ripgrep
    exfatprogs
    exiftool

    # devtools
    clang-tools
    gdb
    nil

    # nettools
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
