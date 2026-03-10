{config,lib,pkgs,...}:
{
  imports = [
    ./session
    ./font.nix
    ./foot.nix
    ./git.nix
    ./kitty.nix
    ./extra.nix 
    ./tofi.nix
    ./zsh.nix
    ./nvim.nix
    ./ranger.nix
  ];
}
