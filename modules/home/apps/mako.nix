{config, lib, theme, ...}:
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
        font = "FiraCode Nerd Font";
        border-size = 2;
        border-radius = 0;
        ignore-timeout = true;
        default-timeout = 3000;
        border-color = "theme.color10";
        text-color = "theme.selection_bg";
        background-color = "theme.background_alt";
      };
    };
  };
}
