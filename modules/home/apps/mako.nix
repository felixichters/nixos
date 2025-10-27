{config, lib, ...}:
{
	options.mako.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable mako";
	};

	config = lib.mkIf config.mako.enable {
		services.mako = { 
			enable = true;
			settings = {
				font = "FiraCode Nerd Font";
				border-size = 2;
				border-radius = 0;
				ignore-timeout = true;
				default-timeout = 3000;
				border-color = "#2a2a2a";
				text-color = "#cccccc";
				background-color = "#191919";
			};
		};
	};
}
