{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
    ../../modules/system/laptop.nix
  ];
  system.stateVersion = "24.11";
}
