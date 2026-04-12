{ config, lib, pkgs, ... }:
{
  imports = [
    ./sway/sway.nix
    ./font.nix
    ./git.nix
    ./kitty.nix
    ./tools.nix
    ./tofi.nix
    ./zsh.nix
    ./nvim.nix
    ./ranger.nix
    ./vscode.nix
    ./firefox.nix
    ./mako.nix
    ./ai.nix
    ./security.nix
    ./apps.nix
    ./chromium.nix
  ];
}
