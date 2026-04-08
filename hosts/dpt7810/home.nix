{ user, pkgs, ... }:

{
  imports = [
    ../../modules/home
    ./extra.nix
  ];
  
  home.username = user;
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
