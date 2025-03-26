{pkgs, ...}:

{
	home.packages = with pkgs; [
		ibm-plex
		nerd-fonts.fira-code
		#nerd-fonts.ibm-plex-mono
	];
	fonts = { 
			fontconfig = { 
				enable = true;
				defaultFonts = {
					serif = ["IBM Plex Serif"];
					sansSerif = ["IBM Plex Sans"];
					monospace = ["FiraCode Nerd Font"];
				};
			};
		};
}
