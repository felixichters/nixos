{config, lib, pkgs, ...}:
{
	options.mako.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable mako";
	};

	config = lib.mkIf (config.mako.enable && config.hyprland.enable) {
		services.mako = { 
			enable = true;
			borderSize = 2;
			borderRadius = 0;
			ignoreTimeout = true;
			defaultTimeout = 3000;
		};
	};
}
