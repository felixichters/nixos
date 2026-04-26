{ config, lib, pkgs, ... }:
{
  options.compat.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable AppImage + nix-ld for non-Nix binaries";
  };

  config = lib.mkIf config.compat.enable {
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
  };
}
