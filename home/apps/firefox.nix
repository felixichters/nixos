{config, lib, pkgs, ...}: 
{
	options.firefox.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable firefox";
	};
	config = lib.mkIf config.firefox.enable {
  	programs.firefox = { 
			enable = true;
		};
	};
}
