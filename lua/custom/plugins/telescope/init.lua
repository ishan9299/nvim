local nnoremap = require('custom.utils').nnoremap

nnoremap("<leader>ff", ":lua require('custom.plugins.telescope.settings').file_browser()<cr>")
nnoremap("<leader>fp", ":lua require('custom.plugins.telescope.settings').nvim_config()<cr>")
nnoremap("<leader>fO", ":lua require('custom.plugins.telescope.settings').os_config()<cr>")
nnoremap("<leader>gf", ":Telescope git_files<cr>")
