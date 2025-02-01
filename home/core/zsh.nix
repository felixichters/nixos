{ config, pkgs, lib,...}:
let 
	myAliases = {
		ll = "ls -l --color=auto";
		ls = "ls --color=auto";
		la = "ls -l -A --color=auto";
		uni = "sudo openconnect --protocol=anyconnect --useragent='AnyConnect'  vpn-ac.uni-heidelberg.de";
		fvim = "nvim $(fzf --preview=\"cat {}\")";
		op = "ss -tuln | awk '/LISTEN/ { split($5, a, \":\"); print a[length(a)] }'";
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
			shellAliases = myAliases;
			#history.append = true;
			#oh-my-zsh = {
			#	enable = true;
			#	plugins = [ "git" "copyfile" ];
			#};
			initExtra = ''
				unsetopt BEEP
				
				autoload -Uz vcs_info
				setopt prompt_subst

				zstyle ':vcs_info:git*' formats '%F{11}%b%f%m%u%c'
				zstyle ':vcs_info:*' enable git
				zstyle ':vcs_info:*' check-for-changes true
				zstyle ':vcs_info:*' stagedstr ' %F{green}+%f'
				zstyle ':vcs_info:*' unstagedstr ' %F{red}-%f'
				zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

				+vi-git-untracked() {
					if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
					git status --porcelain | grep -m 1 '^??' &>/dev/null
					then
						hook_com[misc]=' %F{yellow}?%f'
					fi
				}
				
				precmd() {
					vcs_info
					print -P '%F{blue}%B%~%b%f ''${vcs_info_msg_0_}'
				}
				PROMPT='%(!.#.$) '
				RPROMPT='%F{10}%m@%n%f'
				source "$(fzf-share)/key-bindings.zsh"
				source "$(fzf-share)/completion.zsh"
			'';
		};
	};
}
