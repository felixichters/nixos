{ pkgs, ... }:
let
  myAliases = {
    uni = "sudo openconnect --protocol=anyconnect"
      + " --useragent='AnyConnect'"
      + " vpn-ac.uni-heidelberg.de --no-external-auth";
    #fvim = "nvim $(fzf --preview=\"cat {}\")";
    vpush = "rsync -av --delete ~/docs/ /mnt/docs/";
    vpull = "rsync -av --delete /mnt/docs/ ~/docs/";
  };
  sysFunctions = ''
    sys() {
      local host=$(hostname) user=felix
      local dir="$HOME/.dotfiles/hosts/$host"
      case "$1" in
        rebuild) sys nixos && sys hm ;;
        nixos)   sudo nixos-rebuild switch --flake "$dir#$host" ;;
        hm)      home-manager switch --flake "$dir#$user" ;;
        update)  (cd "$dir" && nix flake update) ;;
        check)   (cd "$dir" && nix flake check --no-build) ;;
        clean)   sudo nix-collect-garbage -d && nix-collect-garbage -d ;;
        init)
          [[ -f flake.nix ]] && echo "flake.nix already exists" && return 1
          cat > flake.nix << 'FLAKE'
{
  description = "dev shell";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.''${system};
    in {
      devShells.''${system}.default = pkgs.mkShell {
        packages = with pkgs; [
        ];
        shellHook = "echo 'done'";
      };
    };
}
FLAKE
          echo "use flake" > .envrc
          direnv allow
          echo "created flake.nix + .envrc"
          ;;
        *)       echo "usage: sys {rebuild|nixos|hm|update|check|clean|init}" ;;
      esac
    }
  '';
  cryptFunctions = ''
    copen() {
      local dev=$1 name=''${2:-crypt}
      sudo cryptsetup luksOpen "$dev" "$name" || return 1
      sudo mkdir -p "/mnt/$name"
      sudo mount "/dev/mapper/$name" "/mnt/$name" \
        && echo "mounted at /mnt/$name"
    }
    cclose() {
      local name=''${1:-crypt}
      sudo umount "/mnt/$name" \
        && sudo cryptsetup luksClose "$name" \
        && echo "closed and unmounted $name"
    }
  '';
in
{
  programs.fzf.enableZshIntegration = true;
  programs.zsh = {
    enable = true;
    loginExtra = ''
      [ "$(tty)" = "/dev/tty1" ] && exec sway ''${SWAY_FLAGS:-}
    '';
    history = {
      size = 100000;
      save = 100000;
      extended = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
      share = true;
    };
    enableCompletion = true;
    completionInit = ''
      autoload -Uz compinit
      compinit -C
    '';
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    plugins = [
      {
        name = "zsh-history-substring-search";
        src = pkgs.zsh-history-substring-search;
        file =
          "share/zsh-history-substring-search"
          + "/zsh-history-substring-search.zsh";
      }
    ];
    shellAliases = myAliases;
    initContent = sysFunctions + cryptFunctions + ''
      unsetopt BEEP
      setopt HIST_FIND_NO_DUPS HIST_REDUCE_BLANKS HIST_VERIFY

      zstyle ':completion:*' menu select
      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down

      autoload -Uz vcs_info
      setopt prompt_subst

      zstyle ':vcs_info:git*' formats '%F{11}%b%f%m%u%c'
      zstyle ':vcs_info:*' enable git
      zstyle ':vcs_info:*' check-for-changes true
      zstyle ':vcs_info:*' stagedstr ' %F{green}+%f'
      zstyle ':vcs_info:*' unstagedstr ' %F{red}-%f'
      zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

      +vi-git-untracked() {
        local in_tree
        in_tree=$(git rev-parse --is-inside-work-tree 2>/dev/null)
        if [[ $in_tree == 'true' ]] && \
        git status --porcelain | grep -m 1 '^??' &>/dev/null
        then
          hook_com[misc]=' %F{yellow}?%f'
        fi
      }

      precmd() {
        vcs_info
        local dev=""
        [[ -n "$IN_NIX_SHELL" || -n "$DIRENV_DIR" ]] && dev=" %F{green}*%f"
        print -P '%F{blue}%B%~%b%f'"$dev"' ''${vcs_info_msg_0_} %F{10}%n@%m%f'
      }
      PROMPT='%(!.#.$) '
      #RPROMPT='%F{8}%? %f%F{10}%m@%n%f'
    '';
  };
}
