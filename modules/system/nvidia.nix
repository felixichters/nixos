{ config, pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages;
  boot.initrd.kernelModules = [
    "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"
  ];
  boot.blacklistedKernelModules = [ "nouveau" "nvidiafb" ];
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [ nvidia-vaapi-driver ];
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
  };

  environment.sessionVariables.SWAY_FLAGS = "--unsupported-gpu";
}
