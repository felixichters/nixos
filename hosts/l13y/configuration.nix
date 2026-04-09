{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ./performance.nix
    ../../modules/system
  ];
  gaming.enable = true;
  environment.systemPackages = [ pkgs.brightnessctl ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11";
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
