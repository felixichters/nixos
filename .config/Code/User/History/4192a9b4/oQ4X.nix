{ config, pkgs, lib, ... }:
{

  programs.neovim = {
    enable = true;
    extraConfig = ''
    '';

    plugins = [
    ];
  };

}