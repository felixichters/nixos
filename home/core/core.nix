{config,lib,pkgs,...}:

{
	imports = [
		./nvim/nvim.nix 
		./session/session.nix
		./font.nix
		./foot.nix
		./git.nix
		./kitty.nix
		./pkgs.nix 
		./tofi.nix
		./zsh.nix
	];
}
