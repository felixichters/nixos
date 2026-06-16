{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
    ../../modules/system/laptop.nix
    ../../modules/system/gaming.nix
  ];
  system.stateVersion = "24.11";
}
