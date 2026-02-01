{config,pkgs,lib,...}:

{
	imports = [
		./extra.nix
		./security.nix
		./ai.nix
	];
}
