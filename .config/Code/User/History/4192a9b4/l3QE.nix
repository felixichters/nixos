{ config, pkgs, lib, ... }:
{

  programs.neovim = 
  let
    to_lua = str: "lua << EOF\n${str}\nEOF\n";
    to_lua_file = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
    '';

    plugins = with pkgs.vimPlugins; [
      
      {
        plugin = lualine-nvim;
        config = to_lua_file ./plugin/lualine.lua;
      }

      {
        plugin = catppuccin-nvim;
        config = "colorscheme catppuccin";
      }

      {
        plugin = solarized-nvim;
        #config = "colorscheme solarized";
      }

      {
        plugin = telescope-nvim;
        config = to_lua_file ./plugin/telescope.lua;
      }

      {
        plugin = nvim-tree;
        config = to_lua_file ./plugin/nvim-tree.lua;
      }

      {
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-bash
          p.tree-sitter-lua
          #p.tree-sitter-python
          p.tree-sitter-cpp
        ]));
        config = to_lua_file ./plugin/treesitter.lua;
      }


    ];
  };

}