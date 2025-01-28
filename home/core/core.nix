{config,lib,pkgs,...}:

{
	imports = [
		./nvim/nvim.nix 
		./session/session.nix
		./font.nix
		./foot.nix
		./git.nix
		./kitty.nix
		./extra.nix 
		./tofi.nix
		./zsh.nix
	];
}
