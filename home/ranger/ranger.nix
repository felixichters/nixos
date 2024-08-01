{config, lib, pkgs, ...}:

{
  programs.ranger = {
    enable = true;
  };
  xdg.configFile."ranger/rifle.conf".text = ''
    ext tex = code "$@"
    ext sh = nvim "$@" 
    ext py = code "$@"
    ext lua = nvim "$@"
    ext pdf = firefox "$@"
    ext jpg = feh "$@"
    ext jpeg = feh "$@"
    ext png = feh "$@"
    ext cpp = nvim "$@"
    ext nix = nvim "$@"
    ext h = nvim "$@"
    ext zip = unzip "$@"
  '';
}
