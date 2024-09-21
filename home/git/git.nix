{ config, pkgs, lib, ...}:

{
  programs.git = {
    enable = true;
    userName  = "felix";
    userEmail = "felix.ichters@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}