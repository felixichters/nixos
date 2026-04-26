{ config, lib, pkgs, ... }:
{
  options.devtools.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "compiler and debugger toolchain";
  };

  config = lib.mkIf config.devtools.enable {
    home.packages = with pkgs; [
      gcc
      clang-tools
      gdb
      nasm
      nil
    ];
  };
}
