{ ... }:
{
  imports = [
    ./user.nix
    ./networking.nix
    ./sound.nix
    ./locales.nix
    ./virtualization.nix
    ./graphics.nix
    ./compat.nix
    ./openssh.nix
    ./gaming.nix
    ./hardening.nix
    ./filesystems.nix
    ./swaylock.nix
    ./wireshark.nix
    ./laptop.nix
    ./nvidia.nix
  ];
}
