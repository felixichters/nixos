{pkgs, ...}:

{
	security.pam.services.swaylock = {};
	security.polkit.enable = true;
	services.udisks2.enable = true;
	programs.light.enable = true;	
	hardware.graphics.enable = true;	
	programs = {
		appimage = {
			enable = true;
			binfmt = true;
			package = pkgs.appimage-run.override {
				extraPkgs = pkgs: [ pkgs.libxshmfence ];
			};
		};
	};

	programs.wireshark.enable = true;
	virtualisation.docker.enable = true;
	programs.virt-manager.enable = true;
	virtualisation.libvirtd.enable = true;
	virtualisation.spiceUSBRedirection.enable = true;
	
	environment.systemPackages = with pkgs; [
	];

	programs.nix-ld = { 
		enable = true;
		libraries = with pkgs; [
			libGL
			libX11
			libpng
			stdenv.cc.cc.lib
		];
	};
}
