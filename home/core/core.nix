{config,lib,pkgs,...}:

{
	imports = [
		./session/session.nix
		./font.nix
		./foot.nix
		./git.nix
		./kitty.nix
		./extra.nix 
		./tofi.nix
		./zsh.nix
		./nvim/nvim.nix
		./ranger.nix
	];
}
