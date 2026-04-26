{
  system = { lib, ... }: {
    virtualization.enable = lib.mkDefault true;
    wireshark.enable = lib.mkDefault true;
  };

  home = { lib, ... }: {
    nixvim.enable = lib.mkDefault true;
    git.enable = lib.mkDefault true;
    tools.enable = lib.mkDefault true;
    devtools.enable = lib.mkDefault true;
    vscode.enable = lib.mkDefault true;
    ranger.enable = lib.mkDefault true;
    monitoring.enable = lib.mkDefault true;
    zsh.enable = lib.mkDefault true;
  };
}
