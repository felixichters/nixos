{ theme, font, ... }:
{
  services.mako = {
    enable = true;
    settings = {
      font = font.name;
      border-size = 2;
      border-radius = 0;
      ignore-timeout = true;
      default-timeout = 3000;
      border-color = theme.mako.border;
      text-color = theme.mako.text;
      background-color = theme.mako.background;
    };
  };
}
