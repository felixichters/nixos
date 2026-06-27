# NixOS Configuration

Flake-based NixOS + standalone Home Manager configuration.

```
lib/        shared builder
vars/       user identity (name, email, locale, …)
modules/
  system/   NixOS modules
  home/     Home Manager modules
  themes/   dark/light color palettes
  fonts/    font definitions
hosts/
  dpt7810/  desktop
  l13y/     laptop
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
sys rebuild    # apply system + home for the current host
sys nixos      # system only
sys hm         # home only
sys update     # nix flake update for this host
sys check      # fast eval check, no build
sys clean      # garbage collect (system + user)
sys init       # scaffold a dev flake.nix in the current directory
```
