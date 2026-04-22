{config, lib, pkgs, ...}:
{
  options.monitoring.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable monitoring tools";
  };
  config = lib.mkIf config.monitoring.enable {
    programs.htop.enable = true;
    program.btop.enable = true;
  };
}
