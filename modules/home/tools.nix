{ pkgs, ... }:
{
  programs.zathura.enable = true;
  programs.feh.enable = true;
  programs.fzf.enable = true;
  programs.jq.enable = true;
  programs.tmux.enable = true;
  programs.bat.enable = true;
  home.packages = with pkgs; [
    just
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
  ];
}
