{ config, pkgs, lib, ...}:

{
	users.users.navi = {
		isNormalUser = true;
		description = "felix";
		extraGroups = [ "networkmanager" "wheel" "video" "audio" "wireshark" "libvirtd" "docker"];
	};
	
	programs.zsh.enable = true;
	users.defaultUserShell = pkgs.zsh;
}
