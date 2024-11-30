{config, lib, pkgs, ...}:

{
	home.packages = with pkgs; [
		fira-code
		iosevka
		inconsolata
		overpass
		(nerdfonts.override { fonts = [ "FiraCode" "Iosevka" "IosevkaTerm" "IosevkaTermSlab" ]; })
	];
	gtk.enable = true;
	gtk.font.name = "overpas";
	fonts = { 
		fontconfig = { 
			enable = true;
			defaultFonts = {
				serif = ["overpass"];
				sansSerif = ["overpass"];
				monospace = ["Iosevka Nerd Font"];
			};
		};
	};
}
