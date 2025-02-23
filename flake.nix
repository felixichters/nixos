{

	description = "nixos-config";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-24.11";
		home-manager.url = "github:nix-community/home-manager/release-24.11";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
		nixneovimplugins.url = "github:jooooscha/nixpkgs-vim-extra-plugins";
		#nixos-hardware.url = "github:NixOS/nixos-hardware/master";
	};

	outputs = { self, nixpkgs, home-manager, nixos-hardware, ...} @ inputs:
		let 
			lib = nixpkgs.lib;
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};
		in {
		nixosConfigurations = {
			l13y = lib.nixosSystem {
				inherit system;
				specialArgs = { inherit inputs; };
				modules = [
				./configuration.nix
				#nixos-hardware.nixosModules.lenovo-thinkpad-l13-yoga
				];
			};
		};
			homeConfigurations = {
			navi = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				extraSpecialArgs = { inherit inputs; };
						modules = [
			./home.nix
					];
			};
			};
	};

}
