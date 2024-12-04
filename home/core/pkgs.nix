{config, lib, pkgs, ...}:
{
	options.core_pkgs.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable core pkgs";
	};
	config = lib.mkIf config.core_pkgs.enable {
		services.udiskie.enable = true;
		services.udiskie.automount = true;
		programs.zathura.enable = true; 
		programs.feh.enable = true;

		programs.htop.enable = true;
		home.packages = with pkgs; [
			cmatrix
			zip
			unzip
			xdg-utils
		];
	};
}
