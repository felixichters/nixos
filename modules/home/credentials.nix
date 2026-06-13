{ pkgs, ... }:
{
  home.packages = with pkgs; [ keepassxc ];
  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-qt;
  };
}
