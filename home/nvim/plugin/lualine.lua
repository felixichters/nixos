require('lualine').setup {
	options = {
		icons_enabled = true,
		--theme = 'lackluster',
	},
	sections = {
		lualine_a = {
			{
				'filename',
				path = 1
			}
		}
	}
}
