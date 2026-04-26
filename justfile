host := `hostname`
user := "felix"

default:
    @just --list

# Apply system + home for the current host
rebuild: system home

# Apply NixOS system config
system:
    sudo nixos-rebuild switch --flake hosts/{{host}}#{{host}}

# Apply Home Manager config
home:
    home-manager switch --flake hosts/{{host}}#{{user}}

# Update flake inputs for the current host only (per-host lock independence)
update:
    cd hosts/{{host}} && nix flake update

# Switch into the hardened specialisation at runtime
hardened:
    sudo /run/current-system/specialisation/hardened/bin/switch-to-configuration switch

# Switch back to the default config (boot generation)
default-mode:
    sudo /run/booted-system/bin/switch-to-configuration switch

# Evaluate the flake without building (catches typos fast)
check:
    cd hosts/{{host}} && nix flake check --no-build
