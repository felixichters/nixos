{config, lib, pkgs, ...}:

{

	services.udiskie.enable = true;
	services.udiskie.automount = true;

  programs.fzf.enable = true;

  programs.ranger.enable = true;

  programs.feh.enable = true;

  programs.zathura.enable = true;

  programs.htop.enable = true;

  services.amberol.enable = true;

  home.packages = with pkgs; [
		libreoffice-qt
		neofetch
		rofi-wayland
		killall
		cmus
		wev
		zip
    unzip
    spotify
    qalculate-qt
  	prismlauncher
		whitesur-icon-theme
		xdg_utils
		swaylock-effects
	];
}
