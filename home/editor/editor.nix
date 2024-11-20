{config, lib, pkgs, ...}:

{
	imports = [
		./nvim/nvim.nix 
		./vscode.nix
	];
}
