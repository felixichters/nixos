{ config, lib, ... }:
{
  options.virtualization.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable Docker + libvirt";
  };

  config = lib.mkIf config.virtualization.enable {
    virtualisation.docker.enable = true;
    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
    programs.virt-manager.enable = true;
  };
}
