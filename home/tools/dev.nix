{config,lib,pkgs,...}:

{
	options.dev.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable development tools";
	};

	config = lib.mkIf config.dev.enable {
		home.packages = with pkgs; [
			python3
			gcc
			#clang
			gdb
			nasm
			#rpi-imager
		];
	};
}
