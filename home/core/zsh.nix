{ config, pkgs, lib,...}:
let 
	myAliases = {
		ll = "ls -l";
		ls = "ls -G";
		uni = "sudo openconnect vpn-ac.uni-heidelberg.de/2fa --useragent='AnyConnect'";
	};
in
{
	options.zsh.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable zsh";
	};

	config = lib.mkIf config.zsh.enable {
		home.packages = with pkgs; [
			pure-prompt
		];
		programs.zsh = {
			enable = true;
			enableCompletion = true;
			autosuggestion.enable = true;
			syntaxHighlighting.enable = true;
			shellAliases = myAliases;
			oh-my-zsh = {
				enable = true;
				plugins = [ "git" "copyfile" ];
			};
			initExtra = ''
				autoload -U promptinit; promptinit
				prompt pure
				unsetopt BEEP
			'';
		};
	};
}
