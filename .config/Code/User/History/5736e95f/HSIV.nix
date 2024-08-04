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

	services.xserver = {
  enable = true;
  displayManager.gdm.enable = true;
  desktopManager.gnome.enable = true;
};
	nixpkgs.config.allowUnfree = true;
	system.stateVersion = "23.11";
	nix.settings.experimental-features = ["nix-command" "flakes"];
}
