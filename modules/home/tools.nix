{ config, lib, pkgs, ... }:
{
  options.tools.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "CLI shell utilities";
  };

  config = lib.mkIf config.tools.enable {
    programs.zathura.enable = true;
    programs.feh.enable = true;
    programs.fzf.enable = true;
    programs.jq.enable = true;
    programs.tmux.enable = true;
    home.packages = with pkgs; [
      just
      cmatrix
      zip
      unzip
      xdg-utils
      p7zip
      wget
      usbutils
      ripgrep
      exfatprogs
      exiftool
    ];
  };
}
