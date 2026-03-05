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
          description: reviews code.
          model: inherit
          ---
          Focus on: 
          - code quality 
          - best practices
          - maintainability
          - readability
        '';

        debugger = ''
          ---
          name: bug-hunter
          description: searches for bugs and issues.
          model: inherit
          ---
          Focus on correct and intendet behavior:  
          - Find and fix bugs
          - identify logical inconsistencies
          - Fix misconfiguration that would corrupt the outcome

          If you need any information to verify its a real problem, ask me before you act.
          Before Fixing anything explain each problem and suggest a fix.
        '';

        explorer = ''
          ---
          name: explorer
          description: explores codebases.
          tools: Read, Glob, Grep, Bash
          model: haiku
          ---
          Explore codebases by analyzing: 
          - Project goals
          - Architecture ans structure
          - Inputs and Outputs
          - Usage
        '';

        tester = ''
          ---
          name: tester
          description: writes tests.
          model: inherit
          ---
          - Write the minimal necessary test suite to verify correct behavior.
            - Write missing tests.
            - Amend existing tests.
          - Run tests to verify everything works as intendet.
        '';

        sota = ''
          --- 
          name: sota
          description: compare project to current state-of-the-art.
          tools: Read, Glob, Grep, WebSearch, WebFetch
          model: inherit
          ---
          Compare this codebase against current state-of-the-art approaches in its domain.
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
