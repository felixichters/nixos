{config,pkgs,lib,...}:

{
	imports = [
		./dev.nix
		./ranger.nix
		./security.nix
		./nvim/nvim.nix
	];
}
