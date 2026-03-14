# Architecture
This is a NixOS + Home Manager (standalone) dotfiles repo managed with Nix Flakes. There are two hosts, each with their own `flake.nix` that pulls in shared modules.

```
hosts/
  dpt7810/    # Desktop
  l13y/       # Laptop
modules/
  system/     # NixOS-level configs (imported in configuration.nix)
  home/       # User-level (home-manager) configs (imported in home.nix)
    core/     # stuff thats needed to have a decent minimal linux expirence
    tools/    # additional high cohesion utilities 
    apps/     # additional applications platforms
```

## Theme System
Colors are defined as Nix variables in each host's `flake.nix`. To use them, import `theme` and access them via the variables `theme.<color>` e.g. `theme.background`.

## Adding a New Package or Config
1. Identify whether it's system-level (`modules/system/`) or user-level (`modules/home/`)
2. Add to the relevant existing module file or create a new one and import it in the hub

(ALWAYS try to find a appropiate Home Manager or NixOS option before suggesting something like home.file)

If creating a new module add a appropriate option like so:
```
{
  options.<module>.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable <module>";
  };

  config = lib.mkIf config.<module>.enable {
    ...
  };
}
```

# Resources
NixOS options https://search.nixos.org/options \
Nix packages https://search.nixos.org/packages \
Home Manager options https://home-manager-options.extranix.com/ or https://nix-community.github.io/home-manager/options.xhtml \
Nixvim options https://nix-community.github.io/nixvim/ \

# Important for you to know
When i ask you to create an agent or statusline or anything related to your (claude-code) configuration. You should do it the nix way in my home-manager configuration /modules/home/tools/ai.nix if possible.