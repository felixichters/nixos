{ config, lib, pkgs, ... }:
{
  options.nvidia.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "proprietary NVIDIA driver; overrides greetd to use sway --unsupported-gpu";
  };

  config = lib.mkIf config.nvidia.enable {
    boot.kernelPackages = pkgs.linuxPackages;
    boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
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

    services.greetd.settings.default_session.command =
      lib.mkForce "${pkgs.tuigreet}/bin/tuigreet --time --cmd 'sway --unsupported-gpu'";
  };
}
