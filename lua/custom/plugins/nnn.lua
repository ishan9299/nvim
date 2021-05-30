local nnoremap = require('custom.utils').nnoremap
vim.g['nnn#set_default_mappings'] = 0
vim.g['nnn#session'] = 'local'
vim.g['nnn#replace_netrw'] = 1
vim.g['nnn#statusline'] = 1
vim.g['nnn#replace_netrw'] = 1
vim.g['nnn#layout'] = { window = { width = 0.9, height = 0.6, highlight = 'Debug' } }

nnoremap('<leader>o-', ':NnnPicker %:p:h<cr>')
