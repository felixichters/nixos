{ config, pkgs, lib, ...}:

{
	programs.fzf.enable = true;
	home.packages = with pkgs; [
		fzf
	];
}
