{ ... }:
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
    ./credentials.nix
    ./nettools.nix
    ./devtools.nix
    ./apps.nix
    ./monitoring.nix
  ];

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
