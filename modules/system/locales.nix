{ user, ... }:
{
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
    xkb.layout = "us,de";
    xkb.variant = "de_se_fi,";
    xkb.options = "caps:swapescape";
  };
  console.keyMap = "us";
}
