# Shared NixOS + standalone Home Manager builder.
#
# Each host's flake.nix imports this and calls it with its own inputs and host
# args. Returns an attrset suitable for use as the flake's outputs. Each host
# keeps its own flake.lock so `nix flake update` stays per-host.
{ inputs, system ? "x86_64-linux" }:

{ host
, user                       # username string, resolved via vars/<user>.nix; or pass an attrset directly
, profiles ? [ "base" ]      # profile names declared in profiles/default.nix
, themeName ? "dark"
, fontName ? "ibm-plex-mono"
, extraSystemModules ? [ ]
, extraHomeModules ? [ ]
}:

let
  inherit (inputs) nixpkgs home-manager nixvim;
  lib = nixpkgs.lib;
  pkgs = nixpkgs.legacyPackages.${system};

  themes = import ../modules/themes;
  fonts = import ../modules/fonts;
  theme = themes.${themeName};
  font = fonts.${fontName};

  userVars = if builtins.isAttrs user then user else import ../vars/${user}.nix;

  specialArgs = {
    inherit inputs host theme font profiles;
    user = userVars;
  };

  allProfiles = import ../profiles;
  resolved = map (name: allProfiles.${name}) profiles;
  systemProfileModules = lib.filter (m: m != null) (map (p: p.system or null) resolved);
  homeProfileModules = lib.filter (m: m != null) (map (p: p.home or null) resolved);
in
{
  nixosConfigurations.${host} = lib.nixosSystem {
    inherit system specialArgs;
    modules = [ ../hosts/${host}/configuration.nix ]
      ++ systemProfileModules
      ++ extraSystemModules;
  };

  homeConfigurations.${userVars.name} = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    extraSpecialArgs = specialArgs;
    modules = [
      ../hosts/${host}/home.nix
      nixvim.homeModules.nixvim
    ]
    ++ homeProfileModules
    ++ extraHomeModules;
  };
}
