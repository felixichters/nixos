{ config, lib, pkgs, ... }:
{
  options.audio.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable PipeWire audio + Bluetooth";
  };

  config = lib.mkIf config.audio.enable {
    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };

    services.pulseaudio.enable = false;

    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
    services.blueman.enable = true;

    environment.systemPackages = with pkgs; [
      pavucontrol
    ];
  };
}
