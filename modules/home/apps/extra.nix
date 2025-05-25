{config,lib,pkgs,...}:

{
	options.app_extra.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable extra apps";
	};

	config = lib.mkIf config.app_extra.enable {
		home.packages = with pkgs; [
			spotify
			discord
			dolphin-emu
			anki
			gnugo
			snes9x
			bsnes-hd
			pcsx2
		];
	};
}
