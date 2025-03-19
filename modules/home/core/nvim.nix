{ config, pkgs, lib, ... }:
{
  options.nixvim.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable nixvim neovim config";
	};
	
	config = lib.mkIf config.nixvim.enable {
		programs.nixvim = {
			enable = true;
			defaultEditor = true;
			clipboard.register = "unnamedplus";
			opts = {
				updatetime = 100;

				number = true; 
				cursorline = true;
				cursorcolumn = false;
				autoindent = true;
				smartindent = true;
				spell = false;
				
				swapfile = false;

				tabstop = 4;
				shiftwidth = 4;
				expandtab = false;
			};
			plugins = { 
				oil.enable = true;
				telescope.enable = true;
				web-devicons.enable = true;
				autoclose.enable = true;
				lualine = {
					enable = true;
					settings.sections = {
						lualine_c = [ { 
							__unkeyed-1 = "filename";
							path = 3;
						}];
					};
				};
				treesitter = {
					enable = true;
					settings = {
						#indent = true;
						highlight.enable = true;
						auto_install = true;
					};
				};
				lsp = {
					enable = true;
					servers = {
						nil_ls.enable = true;
						bashls.enable = true;
						pyright.enable = true;
						clangd.enable = true;
						asm_lsp.enable = true;
					};
				};
				cmp = {
					enable = true;
					autoEnableSources = true;
					settings = {
        		sources = [
							{ name = "nvim_lsp"; }
							{ name = "luasnip"; }
							{ name = "buffer"; }
							{ name = "path"; }
						];
						mapping = {
							"<CR>" = "cmp.mapping.confirm({ select = true })";
							"<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
							"<Up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
							"<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
							"<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
							"<C-d>" = "cmp.mapping.scroll_docs(-4)";
							"<C-f>" = "cmp.mapping.scroll_docs(4)";
							"<C-Space>" = "cmp.mapping.complete()";
						};
					};
				};
				cmp-nvim-lsp.enable = true; 
				cmp-buffer.enable = true; 
				cmp-path.enable = true;
				luasnip.enable = true;
			};
			extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
				name = "lackluster";
				src = pkgs.fetchFromGitHub {
					owner = "slugbyte";
					repo = "lackluster.nvim";
					rev = "662fba7e6719b7afc155076385c00d79290bc347";
					hash = "sha256-oZca/MfsYBW0Fa/yBUGXFZKxJ05DfDNeWj5XaOoU4Mo=";
				};
			})];
			globals = {
				mapleader = " ";
				maplocalleader = " ";
			}; 
			keymaps = [
				{
					action = ":Oil<CR>";
					key = "<C-e>";
					options = {
						silent = true;
						noremap = true;
					};
				}
				{
					action = ":Telescope find_files<CR>";
					key = "ff";
					options = {
						silent = true;
						noremap = true;
					};
				}
				{
					action = ":Telescope live_grep<CR>";
					key = "fg";
					options = {
						silent = true;
						noremap = true;
					};
				}
				{
					action = ":Telescope current_buffer_fuzzy_find<CR>";
					key = "fb";
					options = {
						silent = true;
						noremap = true;
					};
				}
			];
			extraConfigLua = ''
				vim.cmd("colorscheme lackluster")
				vim.opt.list = true
				vim.opt.listchars = { 
					tab = ">-",
				}
			'';
		};
	};
}
