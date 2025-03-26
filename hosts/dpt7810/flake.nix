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
			host = "dpt7810";
			lib = nixpkgs.lib;
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};
			themes = {
				dark = {
					background = "#101010";
					background_alt = "#191919";
					foreground = "#cccccc";
					selection_bg = "#cccccc";
					selection_fg = "#101010";
					border_focused = "#708090";
					border_unfocused = "#2a2a2a";
					wallpaper = "#191919";
					
					color00 = "#080808";
					color01 = "#d70000";
					color02 = "#789978";
					color03 = "#ffaa88";
					color04 = "#708090";
					color05 = "#789978";
					color06 = "#7788aa";
					color07 = "#dddddd";
					color08 = "#555555";
					color09 = "#ffaa88";
					color10 = "#2a2a2a";
					color11 = "#444444";
					color12 = "#aaaaaa";
					color13 = "#dddddd";
					color14 = "#7788aa";
					color15 = "#deeeed";
				};
				light = {
					background = "#eff1f5";
					background_alt = "#e6e9ef";
					foreground = "#4c4f69";
					selection_bg = "#dc8a78";
					selection_fg = "#eff1f5";
					border_unfocused = "#dce0e8";
					border_focused = "#bcc0cc";
					wallpaper = "#e6e9ef";

					color00 = "#5c5f77";
					color01 = "#d20f39";
					color02 = "#40a02b";
					color03 = "#df8e1d";
					color04 = "#1e66f5";
					color05 = "#ea76cb";
					color06 = "#179299";
					color07 = "#acb0be";
					color08 = "#6c6f85";
					color09 = "#d20f39";
					color10 = "#40a02b";
					color11 = "#df8e1d";
					color12 = "#1e66f5";
					color13 = "#ea76cb";
					color14 = "#179299";
					color15 = "#bcc0cc";
				};
			};
			theme = themes.light;

		in {
		nixosConfigurations = {
			${host} = lib.nixosSystem {
				inherit system;
				specialArgs = { 
					inherit inputs host user theme;
				};
				modules = [
					./configuration.nix
				];
			};
		};
		homeConfigurations = {
			${user} = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				extraSpecialArgs = { 
					inherit inputs host user theme;
				};
				modules = [
					./home.nix
					nixvim.homeManagerModules.nixvim
				];
			};
		};
	};
}
