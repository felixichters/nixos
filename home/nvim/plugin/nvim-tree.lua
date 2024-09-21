vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require'nvim-tree'.setup {
  on_attach = function(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- Mappings
    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
    vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
    vim.keymap.set('n', 's', api.node.open.horizontal, opts('Open: Horizontal Split'))
    vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
  end
}

--vim.keymap.set('n', '<c-n>', '<cmd>NvimTreeFindFileToggle<CR>')
