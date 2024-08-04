{ config, pkgs, lib, ... }:
{

  programs.neovim = {
    enable = true;

    viAliases = true;
    extraConfig = ''
    '';

    plugins = [
    ];
  };

}