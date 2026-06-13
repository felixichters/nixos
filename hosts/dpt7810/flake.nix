{
  description = "nixos/home-manager configuration for dpt7810";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = inputs:
    (import ../../lib/mkSystem.nix { inherit inputs; }) {
      host = "dpt7810";
      user = "felix";
      themeName = "dark";
      extraSystemModules = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];
    };
}
