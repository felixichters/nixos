{ config, pkgs, lib,...}:
let 

	myAliases = {
		ll = "ls -l";
		ls = "ls -G";
		vpn = "";
	};
in
{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
		#syntaxHighlighting.catppuccin.enable = true;
		#syntaxHighlighting.catppuccin.flavor = "latte";
		shellAliases = myAliases;
		oh-my-zsh = {
    enable = true;
    plugins = [ "git" ];
		#theme = "avit";
		#theme = "bira";
  	theme = "kphoen";
		#theme = "gnzh";
		};
		initExtra = ''
		unsetopt BEEP
		'';
	};
}
