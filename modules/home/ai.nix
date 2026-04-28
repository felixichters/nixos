{config, pkgs, lib, ...}:

{
  options.ai.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable ai tools";
  };
  config = lib.mkIf config.ai.enable {
    services.ollama = {
      enable = true;
      acceleration = false;
    };
    programs.claude-code = {
      enable = true;
      context = ''
        # System Environment
        This system runs NixOS with Home Manager (standalone). There is no traditional package manager (apt, pip, brew, etc.).

        ## Running Commands
        - Do NOT run `python`, `node`, `ruby`, or other interpreters directly — they are not globally installed.
        - For quick one-off commands, use `nix-shell -p <package> --run "<command>"`.
          - Example: instead of `python script.py`, run `nix-shell -p python3 --run "python script.py"`

        ## Installing Packages
        - Do NOT suggest `pip install`, `npm install -g`, `apt install`, etc. for system-wide installs.
        - Packages are managed via Nix. Suggest adding them to the relevant Nix configuration instead.
        - Project-local dependencies belong in a `flake.nix` devShell.
      '';
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
          Explore projects by analyzing: 
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
    programs.aider-chat.enable = true;
    home.packages = with pkgs; [
      #code-cursor
    ];
  };
}
