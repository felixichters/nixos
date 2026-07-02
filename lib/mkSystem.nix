# Shared NixOS + standalone Home Manager builder.

{ inputs, system ? "x86_64-linux" }:

{ host
, user
, themeName ? "lackluster-dark"
, fontName ? "ibm-plex-mono"
, extraSystemModules ? [ ]
, extraHomeModules ? [ ]
}:

let
  inherit (inputs) nixpkgs home-manager nixvim nix-flatpak;
  lib = nixpkgs.lib;
  pkgs = nixpkgs.legacyPackages.${system};

  themes = import ../modules/themes;
  fonts = import ../modules/fonts;
  theme = themes.${themeName};
  font = fonts.${fontName};

  userVars = if builtins.isAttrs user then user else import ../vars/${user}.nix;

  specialArgs = {
    inherit inputs host theme font;
    user = userVars;
  };
in
{
  nixosConfigurations.${host} = lib.nixosSystem {
    inherit system specialArgs;
    modules = [ ../hosts/${host}/configuration.nix ] ++ extraSystemModules;
  };

  homeConfigurations.${userVars.name} =
    home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    extraSpecialArgs = specialArgs;
    modules = [
      ../hosts/${host}/home.nix
      nixvim.homeModules.nixvim
    ] ++ extraHomeModules;
  };
}
