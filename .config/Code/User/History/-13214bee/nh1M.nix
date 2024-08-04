{ pkgs ? import <nixpkgs> {} }:

pkgs.mkdShell
{
  nativeBuildInputs = with pkgs; [
    gcc
  ];
}