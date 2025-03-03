{
	description = "nixos/home-manager configuration";

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
			user = "navi";
			hostname = "nixos";
			lib = nixpkgs.lib;
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};
		in {
		nixosConfigurations = {
			hostname = lib.nixosSystem {
				inherit system;
				specialArgs = { 
					inherit inputs;
					inherit hostname;
					inherit user;
				};
				modules = [
					./configuration.nix
				];
			};
		};
		homeConfigurations = {
			user = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				extraSpecialArgs = { 
					inherit inputs;
					inherit hostname;
					inherit user;
				};
				modules = [
					./home.nix
					nixvim.homeManagerModules.nixvim
				];
			};
		};
	};
}
