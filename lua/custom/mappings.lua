local utils = require('custom.utils')
local nnoremap = utils.nnoremap

nnoremap("<space>", "<nop>")

-- window commands
nnoremap("<leader>wk", "<cmd>wincmd k<cr>")
nnoremap("<leader>wj", "<cmd>wincmd j<cr>")
nnoremap("<leader>wl", "<cmd>wincmd l<cr>")
nnoremap("<leader>wh", "<cmd>wincmd h<cr>")
nnoremap("<leader>ws", "<cmd>split<cr>")
nnoremap("<leader>wv", "<cmd>vs<cr>")
nnoremap("<leader>wd", "<cmd>q<cr>")
nnoremap("<leader>ws", "<cmd>w<cr>")
nnoremap("<leader>wS", "<cmd>wa<cr>")

-- buffers
nnoremap("<leader>bl", "<C-^>")
nnoremap("<leader>b[", "<cmd>bprevious<cr>")
nnoremap("<leader>b]", "<cmd>bnext<cr>")
nnoremap("<leader>bn", "<cmd>bnext<cr>")
nnoremap("<leader>bp", "<cmd>bprevious<cr>")
nnoremap("<leader>bd", "<cmd>bd<cr>")

-- tabs
nnoremap("tn", "<cmd>tabnew<cr>")
nnoremap("tc", "<cmd>tabclose<cr>")
nnoremap("tj", "<cmd>tabNext<cr>")
nnoremap("tk", "<cmd>tabprevious<cr>")

-- editing
nnoremap("<leader>ew", ":e <C-R>=expand('%:p:h') . '/' <CR>")
nnoremap("<leader>es", ":sp <C-R>=expand('%:p:h') . '/' <CR>")
nnoremap("<leader>ev", ":vsp <C-R>=expand('%:p:h') . '/' <CR>")
nnoremap("<leader>et", ":tabe <C-R>=expand('%:p:h') . '/' <CR>")
nnoremap("<leader>tl", "<cmd>lua require('custom.utils').toggle_line_numbers()<cr>")
