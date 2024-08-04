{ config, pkgs, lib, ... }:
{

  programs.neovim = {
    enable = true;
    extraConfig = ''
      set number relativenumber
    '';

    pulgins = [
      pkgs.vimPlugins.nvim-tree-lua {
        plugin = pkgs.vimPlugins.vim-startify;
        config = "let g:startify_change_to_vcs_root = 0";
      }
    ];
  };

}