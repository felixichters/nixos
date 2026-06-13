{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gcc
    clang-tools
    gdb
    nasm
    nil
  ];
}
