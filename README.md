# NixOS Configuration

## Architecture

Flake based NixOS and Home Manager configuration.

```
hosts/
  dpt7810/      # desktop
  l13y/         # laptop
modules/
  system/       # nixos-level configs (imported in configuration.nix)
  home/         # User-level (home-manager) configs (imported in home.nix)
    core/       # stuff thats needed to have a decent minimal linux expirence
    extended/   # additional utilities 
```
### Modules

Each module is optional like so:
```
{
  options.<module>.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable module";
  };

  config = lib.mkIf config.<module>.enable {
  ...
  };
}
```
### Theme System

Colors are defined as Nix variables in each host's `flake.nix`. To use them, import `theme` and access them via the variables `theme.<color>` e.g. `theme.background`.

## Maintenance

### Update 

```
nix flake update
sudo nixos-rebuild switch --flake . (alias: system-rebuild)
home-manager switch --flake . (alias: home-rebuild)
```

### Cleanup

```
sudo nix-collect-garbage -d
nix-collect-garbage -d
( sudo nix-store --gc )
```
