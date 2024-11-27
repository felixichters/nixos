{config, lib, pkgs, ...}:
{
	options.shell_tools.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable shell tools";
	};
	config = lib.mkIf config.shell_tools.enable {
		programs.fzf.enable = true;
		programs.htop.enable = true;
		programs.ripgrep.enable = true;
		home.packages = with pkgs; [
			cmatrix
			neofetch
			fastfetch
			cowsay
			killall
			zip
			unzip
			whitesur-icon-theme
			xdg-utils
		];
	};
}
