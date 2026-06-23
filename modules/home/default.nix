{ ... }:
{
  imports = [
    ./sway/sway.nix
    ./i3status-rust.nix
    ./font.nix
    ./git.nix
    ./foot.nix
    ./tools.nix
    #./wmenu.nix
    ./rofi.nix
    ./zsh.nix
    ./nvim.nix
    ./ranger.nix
    ./vscode.nix
    ./mako.nix
    ./ai.nix
    ./credentials.nix
    ./apps.nix
    ./monitoring.nix
  ];

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
