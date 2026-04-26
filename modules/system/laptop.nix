{ config, lib, pkgs, ... }:
{
  options.laptop.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "TLP power tuning and brightness control";
  };

  config = lib.mkIf config.laptop.enable {
    environment.systemPackages = [ pkgs.brightnessctl ];
    services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 50;
        START_CHARGE_THRESH_BAT0 = 80;
        STOP_CHARGE_THRESH_BAT0 = 90;
      };
    };
  };
}
