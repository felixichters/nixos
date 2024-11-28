{config, lib, pkgs, ...}:

{
	home.packages = with pkgs; [
		fira-code
		iosevka
		inconsolata
		(nerdfonts.override { fonts = [ "FiraCode" "Iosevka" "IosevkaTerm" "IosevkaTermSlab" ]; })
	];
	fonts.fontconfig.enable = true;
}
