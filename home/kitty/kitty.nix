{ config, pkgs, lib, ... }:

{
	programs.kitty = {
		enable = true;
		font = {
			name = "Fira Code";
			size = 11;
		};
		settings = {
			enable_audio_bell = false;
			confirm_os_window_close = -0;
			window_padding_width = 10;
			font_features = "FiraCodeRoman_400wght +cv31 +cv29 +ss10 +onum";
		};
		shellIntegration.enableZshIntegration = true;
	};
}
