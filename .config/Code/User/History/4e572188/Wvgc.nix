{config, lib, pkgs, ...}:

{
  home.packages = with pkgs; [
    unzip
    feh
    neofetch
    ranger 
    htop-vim
  ];
}