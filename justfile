host := `hostname`
user := "felix"

default:
    @just --list

rebuild: system home

system:
    sudo nixos-rebuild switch --flake hosts/{{host}}#{{host}}

home:
    home-manager switch --flake hosts/{{host}}#{{user}}

update:
    cd hosts/{{host}} && nix flake update

hardened:
    sudo /run/current-system/specialisation/hardened/bin/switch-to-configuration switch

default-mode:
    sudo /run/booted-system/bin/switch-to-configuration switch

check:
    cd hosts/{{host}} && nix flake check --no-build
