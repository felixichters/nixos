{ config, pkgs, ... }:

{
	
	imports = [ 
		./hardware-configuration.nix
		./base/base.nix
		./home/stylix/stylix.nix
	];
		programs.neovim = { 
		enable = true;
	};

	nixpkgs.config.allowUnfree = true;
	system.stateVersion = "23.11";
	nix.settings.experimental-features = ["nix-command" "flakes"];
}
