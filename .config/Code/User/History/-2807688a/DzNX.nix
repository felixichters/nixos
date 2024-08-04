{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.gcc
    pkgs.cmake
  ];
  
  shellHook = ''
    echo "GCC, CMake und Make available."
  '';
}