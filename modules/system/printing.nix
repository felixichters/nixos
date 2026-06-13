{ pkgs, user, ... }:
{
  services.printing = {
    enable = true;
    drivers = with pkgs; [ epson-escpr2 cups-filters cups-browsed ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.sane-airscan ];
  };

  users.users.${user.name}.extraGroups = [ "lp" "scanner" ];
}
