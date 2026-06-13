{ pkgs, font, theme, ... }:

{
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
    mutableExtensionsDir = true;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          continue.continue
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
}
