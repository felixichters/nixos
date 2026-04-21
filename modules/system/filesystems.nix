{ pkgs, ... }:
{
  services.udisks2.enable = true;
  
  environment.systemPackages = with pkgs; [
    parted
  ];

#  fileSystems."/mnt/stash" = {
#    device = "/dev/disk/by-uuid/42d44629-0583-4660-95cf-3a7ceb940954";
#    fsType = "ext4";
#    options = [
#      "noatime"
#      "nofail"
#    ];
#  };
}
