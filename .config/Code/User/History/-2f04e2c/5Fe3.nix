{config, lib, pkgs, ...}:

{
  programs.ranger = {
    enable = true;
  };
  xdg.configFile."ranger/rifle.conf".text = ''
    ext tex = nvim "$@"
    ext sh = nvim "$@" 
    ext py = nvim "$@"
    ext lua = nvim "$@"
    ext pdf = nohup zathura "$@"
    ext jpg = feh "$@"
    ext jpeg = feh "$@"
    ext png = feh "$@"
    ext cpp = nvim "$@"
  '';
}