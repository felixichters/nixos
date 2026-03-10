{ user, pkgs, ... }:

{
  imports = [
    ../../modules/home/core
    ../../modules/home/tools 
    ../../modules/home/apps
  ];
  
  home.username = user;
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "24.05";
  
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
  #home.packages = with pkgs; [
  #	(katago.override {
  #		backend = "eigen";
  #		enableAVX2 = true;
  #	})
  #];
}
