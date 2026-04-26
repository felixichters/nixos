{ config, lib, ... }:
{
  options.wireshark.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "wireshark with group-based capture permissions";
  };

  config = lib.mkIf config.wireshark.enable {
    programs.wireshark.enable = true;
  };
}
