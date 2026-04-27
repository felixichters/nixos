host := `hostname`
user := "felix"

default:
    @just --list

rebuild: system home

system:
    sudo nixos-rebuild switch --flake ./hosts/{{host}}#{{host}}

home:
    home-manager switch --flake ./hosts/{{host}}#{{user}}

update:
    cd hosts/{{host}} && nix flake update

check:
    cd hosts/{{host}} && nix flake check --no-build
