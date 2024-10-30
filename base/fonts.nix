{ config, pkgs, lib, ...}:

{

	fonts.packages = with pkgs; [
		font-awesome
		fira-code
		nerdfonts	
	];

}
