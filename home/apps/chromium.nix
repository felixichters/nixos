{config, lib, pkgs, ...}: 
{
	options.chromium.enable = lib.mkOption {
		type = lib.types.bool;
		default = false;
		description = "enable chromium";
	};
	config = lib.mkIf config.chromium.enable {
  	programs.chromium.enable = true;
	};
}
