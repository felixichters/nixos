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
        plugin = lualine.nvim;
        config = to_lua_file ./plugin/lualine.lua;
      }

      {
        plugin = catppuccin-nvim;
        config = "";
      }

    ];
  };

}