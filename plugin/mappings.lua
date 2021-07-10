local nnoremap = require('custom.utils').nnoremap

nnoremap("<space>", "<nop>")

-- souricing vim/lua files in config
nnoremap("<leader>so", ":lua require('custom.utils').source_files()<cr>")

-- window commands
nnoremap("<leader>wk", ":wincmd k<cr>")
nnoremap("<leader>wj", ":wincmd j<cr>")
nnoremap("<leader>wl", ":wincmd l<cr>")
nnoremap("<leader>wh", ":wincmd h<cr>")
nnoremap("<leader>ws", ":split<cr>")
nnoremap("<leader>wv", ":vs<cr>")
nnoremap("<leader>wd", ":q<cr>")
nnoremap("<leader>w+", "<c-w>+")
nnoremap("<leader>w-", "<c-w>-")
nnoremap("<leader>w=", "<c-w>=")

-- files
nnoremap("<leader>fs", ":w<cr>")
nnoremap("<leader>fS", ":wa<cr>")

-- buffers
nnoremap("<leader>bl", "<C-^>")
nnoremap("<leader>b[", ":bprevious<cr>")
nnoremap("<leader>b]", ":bnext<cr>")
nnoremap("<leader>bn", ":bnext<cr>")
nnoremap("<leader>bp", ":bprevious<cr>")
nnoremap("<leader>bd", ":bd<cr>")

-- tabs
nnoremap("tn", ":tabnew<cr>")
nnoremap("tc", ":tabclose<cr>")
nnoremap("tj", ":tabNext<cr>")
nnoremap("tk", ":tabprevious<cr>")

-- editing
nnoremap("<leader>ew", ":e <C-R>=expand('%:p:h') . '/' <CR>")
nnoremap("<leader>es", ":sp <C-R>=expand('%:p:h') . '/' <CR>")
nnoremap("<leader>ev", ":vsp <C-R>=expand('%:p:h') . '/' <CR>")
nnoremap("<leader>et", ":tabe <C-R>=expand('%:p:h') . '/' <CR>")
nnoremap("<leader>tl", ":lua require('custom.utils').toggle_line_numbers()<cr>")
