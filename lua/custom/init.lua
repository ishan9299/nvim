local g = vim.g
local opt = vim.opt
local execute = vim.cmd

if vim.fn.executable('nvr') == 1 then
	vim.env.GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
end

g.mapleader = " "
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.scrolloff = 5
opt.lazyredraw = true -- don't redraw screen when using macros
opt.hidden = true -- allow us to switch buffers easily
opt.termguicolors = true -- 24-bit RGB in terminal
opt.fillchars = { diff = "∙", fold = "·", vert = "│", eob = " " } -- characters used to fill statuslines and seperators
opt.tabstop = 2 -- 4 spaces equals to one tab
opt.mouse = 'a'
opt.shiftwidth = 2 -- number of spaces for each step of autoindent
opt.undofile = true
opt.expandtab = false
opt.updatetime = 100
opt.timeoutlen = 500
opt.listchars = { tab = "»·", nbsp = "+", trail = "·", extends = "→", precedes = "←", eol = "¬" }
opt.completeopt = { "menuone", "noselect" }
opt.synmaxcol = 500 -- syntax highlighting for 500 colums only
opt.tabstop = 2 -- 2 spaces equals to one tab
opt.shiftwidth = 2 -- number of spaces for each step of autoindent
opt.expandtab = false
opt.textwidth = 120 -- Maximum width of text that is being inserted
opt.foldenable = false -- no folding
opt.wrap = false -- dont wrap the lines

execute 'colorscheme modus-vivendi'

-- my mappings
require('custom.mappings')

-- plugin settings
require('custom.plugins.compe')
require('custom.plugins.fterm')
require('custom.plugins.lspconfig')
-- require('custom.plugins.neogit')
require('custom.plugins.nnn')
require('custom.plugins.telescope')
require('custom.plugins.treesitter')
