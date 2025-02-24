
{
	description = "nixos-config";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixvim.url = "github:nix-community/nixvim";
	};

	outputs = { self, nixpkgs, home-manager, nixvim, ...} @ inputs:
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
				];
			};
		};
		homeConfigurations = {
			navi = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				extraSpecialArgs = { inherit inputs; };
				modules = [
					./home.nix
					nixvim.homeManagerModules.nixvim
				];
			};
		};
	};
}
