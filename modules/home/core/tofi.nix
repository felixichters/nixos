{config, lib, theme, ...}:
{
	options.tofi.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable tofi";
	};

	config = lib.mkIf (config.tofi.enable) {
		programs.tofi = {
			enable = true; 
			settings = {
				width = "100%";
				height = "100%";
				border-width = 0;
				outline-width = 0;
				padding-left = "35%";
				padding-top = "35%";
				result-spacing = 0;
				num-results = 16;
				font = "monospace";
				font-size = 15;
				background-color = "#000A";
				text-color = "#6c6f85";
				selection-color = "#ccd0da";
				input-color = "#eff1f5";
				prompt-color = "#ccd0da";
			};
		};
	};
}
