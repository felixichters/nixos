{config, lib, pkgs, ...}:

{
  programs.ranger = {
    enable = true;
  };
  xdg.configFile."ranger/rifle.conf".text = ''
    ext tex = code "$@"
    ext sh = code "$@" 
    ext py = code "$@"
    ext lua = code "$@"
    ext pdf = firefox "$@"
    ext jpg = feh "$@"
    ext jpeg = feh "$@"
    ext png = feh "$@"
    ext cpp = code "$@"
    ext nix = code "$@"
    ext zip = unzip "$@"
  '';
}