{config,lib,...}:

{
	options.foot.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable foot";
	};
	config = lib.mkIf config.foot.enable {
		programs.foot = {
			enable = true; 
			settings = {
				main = {
					term = "foot";
					font = "IosevkaTermSlab Nerd Font:size=12";
					pad = "10x8";
					dpi-aware = "no";
				};
				cursor = {
					blink = "yes";
				};
				colors = {
					background = "101010";
					foreground = "cccccc";
					flash = "ffaa88";
					
					regular0 = "080808";
					regular1 = "d70000";
					regular2 = "789978";
					regular3 = "ffaa88";
					regular4 = "708090";
					regular5 = "789978";
					regular6 = "7788aa";
					regular7 = "dddddd";

					bright0 = "555555";
					bright1 = "ffaa88";
					bright2 = "2a2a2a";
					bright3 = "444444";
					bright4 = "aaaaaa";
					bright5 = "dddddd";
					bright6 = "7788aa";
					bright7 = "deeeed";
				};
			};
		};
	};
}
