{ config, pkgs, lib, ... }:
{

  programs.neovim = {
    enable = true;
    extraConfig = ''
    '';

    pulgins = [
    ];
  };

}