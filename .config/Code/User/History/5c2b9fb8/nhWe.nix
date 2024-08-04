{ config, pkgs, lib, ... }:

{

	environment.systemPackages = with pkgs; [	
		gcc
		#git
		#unzip
		#feh
		wl-clipboard
		#alacritty
		#kitty
		#neofetch
		#rofi
		#ranger
		#htop-vim
		#fzf
		#zip
		spotify
		#vscode
		#zathura
		#konsole
	];
	
	#programs.firefox.enable = true;

	programs.neovim = { 
		enable = true;
		defaultEditor = true;
	};
	
}
