{ config, lib, pkgs, ... }:

{
  fonts = {
    enable = true; 
    fonts = with pkgs; [
    ];
  };
}

