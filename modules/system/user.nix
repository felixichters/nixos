{ config, pkgs, lib, user, ... }:
{
  options.user.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "create the primary user account";
  };

  config = lib.mkIf config.user.enable {
    users.users.${user.name} = {
      isNormalUser = true;
      description = user.fullName;
      extraGroups = user.extraGroups;
    };

    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;
  };
}
