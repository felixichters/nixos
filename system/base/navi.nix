{ config, pkgs, lib, ...}:

{

	users.users.navi = {
		isNormalUser = true;
		description = "felix";
		extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
		packages = with pkgs; [];
	};

}
