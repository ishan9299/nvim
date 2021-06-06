local nnoremap = require('custom.utils').nnoremap
local actions = require 'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require 'lir.clipboard.actions'

require'lir'.setup {
	show_hidden_files = false,
	devicons_enable = false,
	mappings = {
		['l'] = actions.edit,
		['<C-s>'] = actions.split,
		['<C-v>'] = actions.vsplit,
		['<C-t>'] = actions.tabedit,

		['h'] = actions.up,
		['q'] = actions.quit,
		['<C-[>'] = actions.quit,

		['K'] = actions.mkdir,
		['N'] = actions.newfile,
		['R'] = actions.rename,
		['@'] = actions.cd,
		['Y'] = actions.yank_path,
		['D'] = actions.delete,
		['.'] = actions.toggle_show_hidden,

		['J'] = function()
			mark_actions.toggle_mark()
			vim.cmd('normal! j')
		end,
		['C'] = clipboard_actions.copy,
		['X'] = clipboard_actions.cut,
		['P'] = clipboard_actions.paste,

	},
	hide_cursor = true
}

-- use visual mode
function _G.LirSettings()
	local nnoremap_buf = require('custom.utils').nnoremap_buf
	local nvim_echo = vim.api.nvim_echo
	nnoremap_buf(0, 'x', 'J',
	":<c-u>lua require'lir.mark.actions'.toggle_mark('v')<cr>")
	-- echo cwd
	nvim_echo({{vim.fn.expand('%:p'), 'Normal'}}, false, {})
end

vim.cmd [[augroup lir-settings]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd Filetype lir :lua LirSettings()]]
vim.cmd [[augroup END]]
nnoremap("<leader>o-", ":lua require'lir.float'.toggle()<cr>")
