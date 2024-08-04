{ config, pkgs, lib, ... }:

{
	users.defaultUserShell = pkgs.zsh;
	programs.light.enable = true;
}
