{config, lib, theme, font, ...}:
{
  options.mako.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable mako";
  };

  config = lib.mkIf config.mako.enable {
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
  };
}
