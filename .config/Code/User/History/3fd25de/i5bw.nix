{

	description = "nixos-config";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-24.05";
		home-manager.url = "github:nix-community/home-manager/release-24.05";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
		catppuccin.url = "github:catppuccin/nix";
		stylix.url = "github:danth/stylix";
	};

	outputs = { self, nixpkgs, home-manager, catppuccin, stylix, ...}:
		let 
			lib = nixpkgs.lib;
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};
		in {
		nixosConfigurations = {
			nixos = lib.nixosSystem {
				inherit system;
				modules = [
				./configuration.nix
				stylix.nixosModules.stylix
				];
			};
		};
		homeConfigurations = {
			navi = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [
					./home.nix
					stylix.homeManagerModules.stylix
					catppuccin.homeManagerModules.catppuccin
					];
			};
		};
	};

}
