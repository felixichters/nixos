{ config, lib, pkgs, ... }:
{
  options.credentials.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "keepassxc, gpg";
  };

  config = lib.mkIf config.credentials.enable {
    home.packages = with pkgs; [ keepassxc ];
    programs.gpg.enable = true;
    services.gpg-agent = {
      enable = true;
      pinentry.package = pkgs.pinentry-qt;
    };
  };
}
