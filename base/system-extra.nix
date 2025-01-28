{config, pkgs, lib, ...}:

{
	programs.steam = {
  	enable = true;
  	remotePlay.openFirewall = true; 
		dedicatedServer.openFirewall = true; 
  	localNetworkGameTransfers.openFirewall = true;

		gamescopeSession.enable = true;
	};
	
	environment.systemPackages = with pkgs; [
		mangohud
		nasm
	];
	
	programs.wireshark.enable = true;
	
	virtualisation.docker.enable = true;

	programs.virt-manager.enable = true;

	virtualisation.libvirtd.enable = true;

	virtualisation.spiceUSBRedirection.enable = true;
}
