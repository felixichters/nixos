{ config, lib, pkgs, ... }:
{
  imports = [
    ./sway/sway.nix
    ./font.nix
    ./git.nix
    ./foot.nix
    ./tools.nix
    ./wmenu.nix
    ./zsh.nix
    ./nvim.nix
    ./ranger.nix
    ./vscode.nix
    ./mako.nix
    ./ai.nix
    ./security.nix
    ./apps.nix
    ./chromium.nix
  ];
}
