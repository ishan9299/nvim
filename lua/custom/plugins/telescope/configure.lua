local M = {}

function M.file_browser()
	require('telescope.builtin').file_browser{
		hidden = true,
		cwd = vim.fn.expand('%:p:h')
	}
end

function M.nvim_config()
	require('telescope.builtin').find_files {
		cwd = '~/.config/nvim',
		prompt = '~ dotfiles ~',
	}
end

function M.os_config()
	require('telescope.builtin').git_files {
		cwd = '/etc/nixos',
		prompt = '~ nixos config ~'
	}
end

function M.set_keymap()
	local nnoremap = require('custom.utils').nnoremap
	nnoremap("<leader>ff", ":lua require('custom.plugins.telescope.configure').file_browser()<cr>")
	nnoremap("<leader>fp", ":lua require('custom.plugins.telescope.configure').nvim_config()<cr>")
	nnoremap("<leader>fO", ":lua require('custom.plugins.telescope.configure').os_config()<cr>")
	nnoremap("<leader>gf", ":Telescope git_files<cr>")
	nnoremap("<leader>bb", ":Telescope buffers<cr>")
end

return M
