local M = {}

function M.nnoremap(to, from)
	local nvim_set_keymap = vim.api.nvim_set_keymap
	nvim_set_keymap('n', to, from, {noremap=true})
end

function M.nnoremap_buf(bufnr, to, from)
	local nvim_buf_set_keymap = vim.api.nvim_buf_set_keymap
	nvim_buf_set_keymap(bufnr, 'n', to, from, {noremap=true})
end

function M.tnoremap(to, from)
	local nvim_set_keymap = vim.api.nvim_set_keymap
	nvim_set_keymap('t', to, from, {noremap=true})
end

function M.toggle_line_numbers()
	local relativeNumbers = (vim.wo.rnu and vim.wo.nu)
	local numbers = vim.wo.nu
	if (numbers == false) then
		vim.wo.nu = true
	elseif (numbers == true and relativeNumbers == false) then
		vim.wo.rnu = true
	elseif (relativeNumbers == true) then
		vim.wo.nu = false
		vim.wo.rnu = false
	end
end

function M.source_files()
	local filetype = vim.opt.ft._value
	local execute = vim.cmd
	if filetype == 'lua' then
		execute 'luafile %'
	elseif filetype == 'vim' then
		execute 'so %'
	end
end

return M
