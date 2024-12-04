{config, lib, pkgs, ...}:
{
	options.mako.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable mako";
	};

	config = lib.mkIf config.mako.enable {
		services.mako = { 
			enable = true;
			font = "Iosevka Nerd Font 10";
			borderSize = 2;
			borderRadius = 0;
			ignoreTimeout = true;
			defaultTimeout = 3000;
			borderColor = "#2a2a2a";
			textColor = "#cccccc";
			backgroundColor = "#191919";
		};
	};
}
