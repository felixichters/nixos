{config,lib,pkgs,...}:

{
	options.app_pkgs.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable app packages";
	};

	config = lib.mkIf config.app_pkgs.enable {
		home.packages = with pkgs; [
			spotify
		];
	};
}
