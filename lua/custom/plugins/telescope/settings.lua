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
return M
