local function set_lualine_theme()
    local current_theme = vim.g.colors_name or 'default'
    local lualine_theme = 'auto'

    if current_theme == 'catppuccin-latte' then
        lualine_theme = 'catppuccin-latte'
    elseif current_theme == 'lackluster' then
        lualine_theme = 'lackluster'
    end

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
	},
	sections = {
		lualine_a = {
			{
				'filename',
				path = 2
			}
		}
	}
}

end

set_lualine_theme()

vim.cmd('autocmd ColorScheme * lua set_lualine_theme()')
