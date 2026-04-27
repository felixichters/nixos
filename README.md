# NixOS Configuration

Flake-based NixOS + standalone Home Manager configuration.

```
lib/        shared builder
vars/       user identity (name, email, locale, …)
profiles/   composable bundles
modules/
  system/   NixOS modules
  home/     Home Manager modules
  themes/   dark/light color palettes
  fonts/    font definitions
hosts/
  dpt7810/  desktop
  l13y/     laptop
justfile    convenience commands
```

## Fresh install

```sh
export NIX_CONFIG="experimental-features = nix-command flakes"

nix-shell -p git --run "git clone <repo-url> ~/.dotfiles"

cd ~/.dotfiles/hosts/<host>
sudo nixos-rebuild switch --flake .

nix run github:nix-community/home-manager -- switch --flake .
```

## Usage

```sh
just rebuild       # apply system + home for the current host
just system        # system only
just home          # home only
just update        # nix flake update for this host
just check         # fast eval check, no build
```

## Maintenance

```sh
sudo nix-collect-garbage -d
nix-collect-garbage -d
```
