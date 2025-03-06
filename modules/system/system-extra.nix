{...}:

{
	security.pam.services.swaylock = {};
	security.polkit.enable = true;

	programs.light.enable = true;
	
	programs.appimage.enable = true;	
	
	programs.wireshark.enable = true;
	
	virtualisation.docker.enable = true;

	programs.virt-manager.enable = true;
	virtualisation.libvirtd.enable = true;
	virtualisation.spiceUSBRedirection.enable = true;
}
