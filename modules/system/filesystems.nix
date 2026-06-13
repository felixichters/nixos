{ pkgs, ... }:
{
  services.udisks2.enable = true;

  environment.systemPackages = with pkgs; [
    parted
    cryptsetup
  ];
}
