{config,lib,pkgs,...}:
{
  imports = [
    ./vscode.nix
    ./firefox.nix
    ./mako.nix
    ./ai.nix
    ./security.nix
    ./extra.nix
  ];
}
