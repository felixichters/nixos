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
            profiles = {
                default = {
                    extensions = with pkgs.vscode-extensions; [
                    ];
                    userSettings = {
                        "telemetry.telemetryLevel" = "off";
                        #"editor.fontFamily" = "JetBrains Mono Nerd Font";
                        #"editor.fontSize" = 13;
                        #"editor.fontLigatures" = true;
                        #"editor.tabSize" = 4;
                        #"window.menuBarVisibility" = "toggle";
                        #"workbench.colorTheme" = lib.mkForce "Solarized Dark";
                        #"workbench.colorTheme" = lib.mkForce "Catppuccin Latte";
                        #"workbench.iconTheme" = "vscode-great-icons";
                        #"catppuccin.accentColor" = "blue"; 
                    };
                };
            };
        };
    };
}
