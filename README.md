# NixOS Configuration

## Architecture

Flake based NixOS and Home Manager configuration.

```
hosts/
  dpt7810/      # desktop
  l13y/         # laptop
modules/
  system/       # system-level config
  home/         # user-level config
  themes/       # shared color themes
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

Colors are defined in `modules/themes/default.nix` and imported by each host's `flake.nix`. To use them in a module, access `theme.<color>` e.g. `theme.background`.

## Fresh Install

Complete the NixOS installer and reboot into a working base system.

### 1. Enable flakes temporarily

Flakes are enabled permanently once the dotfiles config is applied. Enable them for the current session:

```
export NIX_CONFIG="experimental-features = nix-command flakes"
```

### 2. Clone the repository

```
nix-shell -p git --run "git clone <repo-url> ~/.dotfiles"
```

### 3. Apply the NixOS configuration

```
cd ~/.dotfiles/hosts/<host>
sudo nixos-rebuild switch --flake .
```

This installs all system packages and enables flakes permanently.

### 4. Apply the Home Manager configuration

Home Manager is used standalone (not as a NixOS module). Bootstrap it with `nix run`:

```
nix run github:nix-community/home-manager -- switch --flake .
```

After this step the full environment is active. Log out and back in and start a Sway session.

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
