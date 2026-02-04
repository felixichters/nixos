{ config, host, lib,...}:
let 
    myAliases = {
        uni = "sudo openconnect --protocol=anyconnect --useragent='AnyConnect' vpn-ac.uni-heidelberg.de --no-external-auth";
        fvim = "nvim $(fzf --preview=\"cat {}\")";
        system-rebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles/hosts/${host}/";
        home-rebuild = "home-manager switch --flake ~/.dotfiles/hosts/${host}/";
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
            initContent = ''
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
                    print -P '%F{blue}%B%~%b%f ''${vcs_info_msg_0_} %F{8}%? %f%F{10}%m@%n%f'
                }
                nix_prompt_prefix() {
                    [[ -n "$IN_NIX_SHELL" ]] && echo "[nix] "
                }
                PROMPT='%F{green}$(nix_prompt_prefix)%f%(!.#.$) '
                #RPROMPT='%F{8}%? %f%F{10}%m@%n%f'
                source "$(fzf-share)/key-bindings.zsh"
                source "$(fzf-share)/completion.zsh"
            '';
        };
    };
}
