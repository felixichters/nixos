{ config, pkgs, lib, ...}:

{
    options.vscode.enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "enable vscode";
    };

    config = lib.mkIf config.vscode.enable {
        
        programs.vscode = {
            enable = true;
            package = pkgs.vscodium;
            profiles = {
                default = {
                    extensions = with pkgs.vscode-extensions; [
                        ms-python.python
                        llvm-vs-code-extensions.vscode-clangd
                        jnoortheen.nix-ide
                        ms-toolsai.jupyter
                    ];
                    userSettings = {
                        "editor.fontFamily" = "FiraCode Nerd Font";
                        "editor.fontLigatures" = "true";
                        "terminal.integrated.defaultProfile.linux" = "zsh";
                        #"files.autoSave" = "off";
                        #"editor.formatOnSave" = "true";
                    };
                };
            };
        };
    };
}
