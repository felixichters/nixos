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
        statusline = {
          type = "command";
          command = ''jq -r '"[\(.model.display_name)] \(.workspace.project_dir | split("/") | last) | ctx: \(.context_window.used_percentage | floor)%"' '';
          padding = 0;
        };
      };
      agents = {
        code-reviewer = ''

        '';
        documentation =
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
