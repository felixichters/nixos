{
  description = "nixos/home-manager configuration for l13y";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = inputs:
    (import ../../lib/mkSystem.nix { inherit inputs; }) {
      host = "l13y";
      user = "felix";
      themeName = "dark";
      profiles = [ "base" "desktop" "developer" "laptop" "ai" "hardened" ];
    };
}
