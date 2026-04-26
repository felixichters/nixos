{ config, lib, ... }:
{
  options.graphics.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable hardware graphics acceleration";
  };

  config = lib.mkIf config.graphics.enable {
    hardware.graphics.enable = true;
  };
}
