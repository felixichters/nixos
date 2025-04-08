{config,lib,pkgs,...}:

{
	options.extra.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable extra tools";
	};

	config = lib.mkIf config.dev.enable {
		home.packages = with pkgs; [
			python3
			gcc
			#clang
			gdb
			nasm
			#rpi-imager
			wineWowPackages.waylandFull
		];
	};
}
