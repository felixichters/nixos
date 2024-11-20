{config,lib,pkgs,...}:

{
	options.devtools.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable development tools";
	};

	config = lib.mkIf config.devtools.enable {
		home.packages = with pkgs; [
			python3
			gcc
			clang
			gdb
		];
	};
}