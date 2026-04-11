{ config, lib, theme, ... }:
{
  options.tofi.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable tofi";
  };

  config = lib.mkIf (config.tofi.enable) {
    programs.tofi = {
      enable = true; 
      settings = {
        width = "100%";
        height = "100%";
        border-width = 0;
        outline-width = 0;
        padding-left = "35%";
        padding-top = "35%";
        result-spacing = 0;
        num-results = 16;
        font = "monospace";
        font-size = 15;
        background-color = theme.tofi."background-color";
        text-color       = theme.tofi."text-color";
        selection-color  = theme.tofi."selection-color";
        input-color      = theme.tofi."input-color";
        prompt-color     = theme.tofi."prompt-color";
      };
    };
  };
}
