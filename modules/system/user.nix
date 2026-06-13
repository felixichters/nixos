{ pkgs, user, ... }:
{
  users.users.${user.name} = {
    isNormalUser = true;
    description = user.fullName;
    extraGroups = user.extraGroups;
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
