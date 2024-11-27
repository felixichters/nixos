{

	description = "nixos-config";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-24.11";
		home-manager.url = "github:nix-community/home-manager/release-24.11";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
		nixneovimplugins.url = "github:jooooscha/nixpkgs-vim-extra-plugins";
	};

	outputs = { self, nixpkgs, home-manager, ...} @ inputs:
		let 
			lib = nixpkgs.lib;
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};
		in {
		nixosConfigurations = {
			nixos = lib.nixosSystem {
				inherit system;
				specialArgs = { inherit inputs; };
				modules = [
				./configuration.nix
				#stylix.nixosModules.stylix
				];
			};
		};
			homeConfigurations = {
			navi = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				extraSpecialArgs = { inherit inputs; };
						modules = [
			./home.nix
					#catppuccin.homeManagerModules.catppuccin
						#hyprland.homeManagerModules.default
						#{
						#wayland.windowManager.hyprland.enable = true;
						#}
					];
			};
			};
	};

}
