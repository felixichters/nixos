{ pkgs, ... }:
{
  programs.appimage = {
    enable = true;
    binfmt = true;
    package = pkgs.appimage-run.override {
      extraPkgs = pkgs: [ pkgs.libxshmfence ];
    };
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      libGL
      libX11
      libpng
      stdenv.cc.cc.lib
    ];
  };
}
