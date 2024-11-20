{ config, pkgs, lib,...}:
let 
	myAliases = {
		ll = "ls -l";
		ls = "ls -G";
		uni = "sudo openconnect --protocol=anyconnect --useragent='AnyConnect'  vpn-ac.uni-heidelberg.de";
	};
in
{
	options.zsh.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable zsh";
	};

	config = lib.mkIf config.zsh.enable {
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
			#theme = "kphoen";
			#theme = "gnzh";
			};
			initExtra = ''
			neofetch --off
			fpath+=($HOME/.zsh/pure)
			autoload -U promptinit; promptinit
			prompt pure
			unsetopt BEEP
			'';
		};
	};
}
