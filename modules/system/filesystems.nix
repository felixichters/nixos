{ config, lib, pkgs, ... }:
{
  options.filesystems.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable udisks2 + filesystem utilities";
  };

  config = lib.mkIf config.filesystems.enable {
    services.udisks2.enable = true;

    environment.systemPackages = with pkgs; [
      parted
    ];
  };
}
