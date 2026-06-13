{ pkgs, ... }:
{
  programs.obsidian = {
    enable = true;
  };
  programs.firefox.enable = true;
  home.packages = with pkgs; [
    dolphin-emu
    #gnugo
    xournalpp
    #libreoffice
  ];
}
