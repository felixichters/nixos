-- Update -- 

nix flake update
sudo nixos-rebuild switch --flake . (alias: system-rebuild)
home-manager switch --flake . (alias: home-rebuild)

-- Cleanup --

sudo nix-collect-garbage -d
nix-collect-garbage -d
( sudo nix-store --gc )
