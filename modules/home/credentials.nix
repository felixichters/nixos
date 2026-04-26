{ config, lib, pkgs, ... }:
{
  options.credentials.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "keepassxc, gpg";
  };

  config = lib.mkIf config.credentials.enable {
    home.packages = with pkgs; [ keepassxc ];
    programs.gpg.enable = true;
  };
}
