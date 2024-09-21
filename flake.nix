{

	description = "nixos-config";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
		nixneovimplugins.url = "github:jooooscha/nixpkgs-vim-extra-plugins";


		
		#hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
		#hyprland-plugins = {
		#  url = "github:hyprwm/hyprland-plugins";
		#  inputs.hyprland.follows = "hyprland";
		#};
		#hypr-dynamic-cursors = {
		#    url = "github:VirtCode/hypr-dynamic-cursors";
		#    inputs.hyprland.follows = "hyprland"; 
		#};

		#catppuccin.url = "github:catppuccin/nix";
		stylix.url = "github:danth/stylix";
	};

	outputs = { self, nixpkgs, home-manager, stylix, ...} @ inputs:
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
					stylix.homeManagerModules.stylix
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
