{ config, pkgs, lib, ... }:

{
	programs.kitty = {
		enable = true;
		#font = {
		#	name = "Fira Code";
		#	size = 12;
		#};
		settings = {
			enable_audio_bell = false;
			confirm_os_window_close = -0;
		};
		shellIntegration.enableZshIntegration = true;
	};
}
