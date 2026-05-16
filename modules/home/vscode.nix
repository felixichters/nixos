{ config, pkgs, lib, font, theme, ...}:

{
  options.vscode.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "enable vscode";
  };

  config = lib.mkIf config.vscode.enable {

    home.file.".continue/config.yaml".text = ''
      name: local
      version: 1.0.0
      schema: v1
      models:
        - name: qwen2.5-coder:7b
          provider: ollama
          model: qwen2.5-coder:7b
        - name: qwen2.5-coder:3b
          provider: ollama
          model: qwen2.5-coder:3b
        - name: phi4-mini
          provider: ollama
          model: phi4-mini:latest
    '';

    programs.vscodium = {
      enable = true;
      mutableExtensionsDir = false;
      profiles = {
        default = {
          extensions = (with pkgs.vscode-extensions; [
            ms-python.python
            llvm-vs-code-extensions.vscode-clangd
            jnoortheen.nix-ide
            #ms-toolsai.jupyter
            mads-hartmann.bash-ide-vscode
            #anthropic.claude-code
            continue.continue
          ]) ++ [
            (pkgs.vscode-utils.buildVscodeMarketplaceExtension {
              mktplcRef = {
                publisher = "ryanolsonx";
                name = "seoul";
                version = "1.3.0";
                sha256 = "0vawywz4fay64wkwf7k035wrxijnm89fqi787ddqkh3r23livk9l";
              };
            })
          ];
          userSettings = {
            "editor.fontFamily" = font.name;
            "editor.fontLigatures" = true;
            "terminal.integrated.defaultProfile.linux" = "zsh";
            "files.simpleDialog.enable" = true;
            "workbench.colorTheme" = if theme.variant == "light"
              then "Default Light Modern"
              else "Default Dark Modern";
            #"files.autoSave" = "off";
            #"editor.formatOnSave" = "true";
          };
          keybindings = [
            {
              key = "ctrl+enter ctrl+enter";
              command = "workbench.action.terminal.toggleTerminal";
              when = "editorTextFocus || terminalFocus";
            }
            #{
              #key = "ctrl+enter+a";
              #command = "workbench.action.terminal.new";
            #}
          ];
        };
      };
    };
  };
}
