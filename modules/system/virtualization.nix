{ ... }:
{
  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  programs.virt-manager.enable = true;
  boot.kernelModules = [ "kvm-intel" ];
}
