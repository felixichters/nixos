local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'slugbyte/lackluster.nvim'
  use 'wbthomason/packer.nvim'
  use 'nvim-lualine/lualine.nvim'
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-treesitter/nvim-treesitter'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'L3MON4D3/LuaSnip'
	use 'junegunn/fzf.vim'
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		requires = {{'nvim-lua/plenary.nvim'}}
	}

	if packer_bootstrap then
    require('packer').sync()
  end
end)
