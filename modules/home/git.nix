{ config, pkgs, lib, ...}:

{
  options.git.enable = lib.mkOption {
    type = lib.types.bool;
    default = true; 
    description = "enable git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name  = "felix";
          email = "ichters.fe@gmail.com";
        };
        init.defaultBranch = "main";
        pull.rebase = true;
        push.autoSetupRemote = true;
      };
      signing.format = null;
      ignores = [
        "CLAUDE.md"
      ];
    };
  };	
}
