{pkgs, ...}:

{
	security.pam.services.swaylock = {};
	security.polkit.enable = true;

	programs.light.enable = true;	

	programs = {
		appimage = {
			enable = true;
			binfmt = true;
			package = pkgs.appimage-run.override {
				extraPkgs = pkgs: [ pkgs.xorg.libxshmfence ];
			};
		};
	};

	programs.wireshark.enable = true;
	
	virtualisation.docker.enable = true;

	programs.virt-manager.enable = true;
	virtualisation.libvirtd.enable = true;
	virtualisation.spiceUSBRedirection.enable = true;

	programs.nix-ld = { 
		enable = true;
		libraries = with pkgs; [
			libGL
			xorg.libX11
			libpng
			stdenv.cc.cc.lib
		];
	};
}
