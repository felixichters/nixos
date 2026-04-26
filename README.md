# NixOS Configuration

Flake-based NixOS + standalone Home Manager for two hosts.

```
lib/        shared builder (mkSystem.nix)
vars/       user identity (name, email, locale, …)
profiles/   composable bundles — base, desktop, developer, gaming, nvidia, laptop, ai, hardened
modules/
  system/   NixOS modules, each with options.<x>.enable
  home/     Home Manager modules, each with options.<x>.enable
  themes/   dark / light color palettes
  fonts/    font definitions
hosts/
  dpt7810/  desktop — flake.nix, flake.lock, configuration.nix, home.nix
  l13y/     laptop  — flake.nix, flake.lock, configuration.nix, home.nix
justfile    convenience commands
```

## Fresh install

```sh
# 1. Enable flakes for this session
export NIX_CONFIG="experimental-features = nix-command flakes"

# 2. Clone
nix-shell -p git --run "git clone <repo-url> ~/.dotfiles"

# 3. Apply system config
cd ~/.dotfiles/hosts/<host>
sudo nixos-rebuild switch --flake .

# 4. Bootstrap Home Manager (first time only)
nix run github:nix-community/home-manager -- switch --flake .
```

## Usage

```sh
just rebuild       # apply system + home for the current host
just system        # system only
just home          # home only
just update        # nix flake update for this host (doesn't touch the other host's lock)
just check         # fast eval check, no build
```

## Hardened mode

```sh
just hardened      # switch into the hardened specialisation at runtime
just default-mode  # switch back
# or pick "NixOS - hardened" at the boot menu
```

Hardened mode enforces: Mullvad VPN + kill-switch, DNS-over-TLS, hardened kernel, sysctl lockdown, AppArmor + firejail, Tor Browser/Librewolf, ephemeral journal, no shell history.  
After the first rebuild, log in once: `mullvad account login <token>` + `mullvad lockdown-mode set on`.

## Maintenance

```sh
sudo nix-collect-garbage -d
nix-collect-garbage -d
```
