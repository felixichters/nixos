{config, pkgs, lib, ...}:

{
	programs.light.enable = true;
	
	programs.appimage.enable = true;	
	
	services.udisks2.enable = true;
	
	programs.wireshark.enable = true;
	
	virtualisation.docker.enable = true;

	programs.virt-manager.enable = true;
	virtualisation.libvirtd.enable = true;
	virtualisation.spiceUSBRedirection.enable = true;
}
