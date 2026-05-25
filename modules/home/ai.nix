{config, pkgs, lib, ...}:

{
  options.ai.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
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
        # Philosophy and Style
        My projects follow a sharp and lean philosophy. Prioritize simplicity, efficiency, mechanical sympathy, elegance and creativity over heavy dependencies, fancy UI and GUI. No bullshit.
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
          command = ''jq -r '"[\(.model.display_name)] \(.workspace.project_dir | split("/") | last) | ctx: \((.context_window.used_percentage // 0) | floor)% | 5h: \((.rate_limits.five_hour.used_percentage // 0) | floor)% (\(if .rate_limits.five_hour.resets_at then (.rate_limits.five_hour.resets_at | strflocaltime("%H:%M")) else "?" end)) 7d: \((.rate_limits.seven_day.used_percentage // 0) | floor)% (\(if .rate_limits.seven_day.resets_at then (.rate_limits.seven_day.resets_at | strflocaltime("%a")) else "?" end))"' '';
          padding = 0;
        };
      };
    };
    programs.aider-chat.enable = true;
  };
}
