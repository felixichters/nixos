{config, lib, pkgs, ...}:

{
	home.packages = with pkgs; [
		iosevka
		noto-fonts
		ubuntu_font_family
		(nerdfonts.override { fonts = [ "Iosevka" "IosevkaTerm" "IosevkaTermSlab" ]; })
	];
	fonts = { 
			fontconfig = { 
				enable = true;
				defaultFonts = {
					serif = ["Noto Serif"];
					sansSerif = ["Ubuntu" "Noto Sans"];
					monospace = ["Iosevka Nerd Font"];
				};
			};
		};
}
