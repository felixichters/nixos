{ config, lib, pkgs, ... }:
{
	hardware.graphics.enable = true;
	nixpkgs.config.nvidia.acceptLicense = true;
	services.xserver.videoDrivers = ["nvidia"];
	hardware.nvidia = {
		modesetting.enable = true;
		powerManagement.enable = false;
		powerManagement.finegrained = false;
		open = false;
		nvidiaSettings = true;
		package = config.boot.kernelPackages.nvidiaPackages.latest;
	};
}
