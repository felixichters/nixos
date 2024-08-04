{ config, pkgs, lib, ... }:

{

	environment.systemPackages = with pkgs; [	
		#gcc
		#git
		#unzip
		#feh
		#alacritty
		#kitty
		#neofetch
		#rofi
		#ranger
		#htop-vim
		#fzf
		#zip
		#spotify
		#vscode
		#zathura
		#konsole
	];
}
