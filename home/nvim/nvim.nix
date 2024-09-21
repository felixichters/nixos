{ config, pkgs, lib, inputs, ... }:
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

    extraPackages = with pkgs; [
      lua-language-server
			nil
      #rnix-lsp
			ccls
			wl-clipboard
    ];

		extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
    '';
		
    plugins = with pkgs.vimPlugins; [
     
      {
        plugin = nvim-lspconfig;
        #type = "lua";
				config = to_lua_file ./plugin/lsp.lua;
      }
      
			{
				plugin = oil-nvim;
				config = to_lua_file ./plugin/oil.lua;
			}
			nvim-cmp 
      {
        plugin = nvim-cmp;
				#type = "lua";
        config = to_lua_file ./plugin/cmp.lua;      
			}
			
			cmp_luasnip
      cmp-nvim-lsp
			
      luasnip
      friendly-snippets
			
			{
        plugin = lualine-nvim;
				#type = "lua";
        config = to_lua_file ./plugin/lualine.lua;
      }

      {
        plugin = nvim-solarized-lua;
        #config = "colorscheme solarized";
      }
			{
				plugin = gruvbox-nvim;
				#config = "colorscheme gruvbox";
			}
		
      {
        plugin = telescope-nvim;
        #type = "lua";
				config = to_lua_file ./plugin/telescope.lua;
      }

      {
        plugin = nvim-tree-lua;
				#type = "lua";
        config = to_lua_file ./plugin/nvim-tree.lua;
      }
				
			nvim-web-devicons

      {
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-cpp
        ]));
				#type = "lua";
        config = to_lua_file ./plugin/treesitter.lua;
      }
    ];
  };

}