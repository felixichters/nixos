{config, lib, pkgs, ...}:
{
	options.core_extra.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable core extras";
	};
	config = lib.mkIf config.core_extra.enable {
		services.udiskie.enable = true;
		services.udiskie.automount = true;
		programs.zathura.enable = true; 
		programs.feh.enable = true;
		programs.fzf.enable = true;
		programs.htop.enable = true;
		programs.neovim.enable = true;
		home.packages = with pkgs; [
			cmatrix
			zip
			unzip
			xdg-utils
			p7zip
			wget
		];
	};
}
