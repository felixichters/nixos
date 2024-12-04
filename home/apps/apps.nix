{config,lib,pkgs,...}:
{
	imports = [
		./vscode.nix
		./firefox.nix
		./mako.nix 
		./pkgs.nix
	];
}
