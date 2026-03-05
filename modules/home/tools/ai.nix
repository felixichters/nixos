{config, pkgs, lib, ...}:

{
  options.ai.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable ai tools";
  };
  config = lib.mkIf config.ai.enable {
    programs.claude-code = {
      enable = true;
      settings = {
        statusLine = {
          type = "command";
          command = ''jq -r '"[\(.model.display_name)] \(.workspace.project_dir | split("/") | last) | ctx: \((.context_window.used_percentage // 0) | floor)%"' '';
          padding = 0;
        };
      };
      agents = {
        code-review = ''
          ---
          name: code-review
          description: Reviews code
          model: inherit
          ---
          You are specializing in code reviews.
          Focus on bugs, code quality, security, best practices etc..
        '';
      };
    };
    #programs.aider-chat = {
    #  enable = true;
    #  settings = {
    #    dark-mode = true;
    #    openai-api-base = "http://127.0.0.1:8080/v1";
    #    openai-api-key = "dummy";
    #  };
    #};
    home.packages = with pkgs; [
      #code-cursor
    ];
  };
}
