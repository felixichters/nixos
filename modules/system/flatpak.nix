{ config, lib, pkgs, ... }:
{
  options.flatpak.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "enable flatpak with XDG portals for Wayland";
  };

  config = lib.mkIf config.flatpak.enable {
    services.flatpak = {
      enable = true;

      remotes = [{
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }];

      packages = [
        { appId = "org.gephi.Gephi"; origin = "flathub"; }
        { appId = "com.discordapp.Discord"; origin = "flathub"; }
      ];

      overrides."org.gephi.Gephi".Environment."_JAVA_AWT_WM_NONREPARENTING" = "1";
    };

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config.common = {
        default = "gtk";
        "org.freedesktop.impl.portal.ScreenCast" = "wlr";
        "org.freedesktop.impl.portal.Screenshot" = "wlr";
      };
    };
  };
}
