{config, lib, pkgs, ...}:

{
  home.packages = with pkgs; [
    autotiling
    rofi
  ];
}