{ config, pkgs, lib, ...}:

{
	imports = [
		./kitty.nix
		./ranger.nix
		./tools.nix
		./zsh.nix
	];
}
