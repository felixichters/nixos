{ config, lib, user, ... }:
{
  options.locales.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable locale + timezone + keymap";
  };

  config = lib.mkIf config.locales.enable {
    time.timeZone = user.timezone;
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = user.locale;
      LC_IDENTIFICATION = user.locale;
      LC_MEASUREMENT = user.locale;
      LC_MONETARY = user.locale;
      LC_NAME = user.locale;
      LC_NUMERIC = user.locale;
      LC_PAPER = user.locale;
      LC_TELEPHONE = user.locale;
      LC_TIME = user.locale;
    };
    services.xserver = {
      xkb.layout = "de";
      xkb.variant = "";
    };
    console.keyMap = "de";
  };
}
