local execute = vim.cmd
local g = vim.g
local opt = vim.opt

if vim.fn.executable("nvr") == 1 then
	vim.env.GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
end

execute [[
augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
augroup END
]]

g.mapleader = ' '
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- neovide
g.neovide_fullscreen = true
g.neovide_cursor_animation_length = 0.10
g.neovide_cursor_trail_length=0.8

opt.background = 'light'
opt.completeopt = { "menuone", "noselect" }
opt.expandtab = false
opt.expandtab = false
opt.fillchars = { diff = "∙", fold = "·", vert = "│", eob = " " } -- characters used to fill statuslines and seperators
opt.foldenable = false -- no folding
opt.hidden = true -- allow us to switch buffers easily
opt.inccommand = 'nosplit'
opt.lazyredraw = true -- don't redraw screen when using macros
opt.listchars = { tab = "»·", nbsp = "+", trail = "·", extends = "→", precedes = "←", eol = "¬" }
opt.mouse = 'a'
opt.scrolloff = 5
opt.shiftwidth = 2 -- number of spaces for each step of autoindent
opt.shiftwidth = 2 -- number of spaces for each step of autoindent
opt.showcmd = false
opt.showmode = false
opt.synmaxcol = 500 -- syntax highlighting for 500 colums only
opt.tabstop = 2 -- 2 spaces equals to one tab
opt.tabstop = 2 -- 4 spaces equals to one tab
opt.termguicolors = true -- 24-bit RGB in terminal
opt.textwidth = 120 -- Maximum width of text that is being inserted
opt.undofile = true
opt.updatetime = 250
opt.wrap = false -- dont wrap the lines
opt.cmdheight = 1
opt.guifont = "VictorMono Nerd Font:h18"


g.solarized_statusline = 'flat'
execute "colorscheme modus-vivendi"

-- my mappings
require("custom.mappings")

-- plugin settings
local plugins = {
	"fterm",
	"lir",
	"pears",
	"telescope",
	"treesitter",
}
for _,v in pairs(plugins) do
	local module = "custom.plugins." .. v
	require(module)
end
