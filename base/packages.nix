{ config, pkgs, lib, ... }:

{  
	programs.zsh.enable = true;
	users.defaultUserShell = pkgs.zsh;
	programs.light.enable = true;
}
