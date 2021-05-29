local nnoremap = require('custom.utils').nnoremap
local tnoremap = require('custom.utils').tnoremap
require'FTerm'.setup({
	dimensions  = {
		height = 0.9,
		width = 0.9,
		x = 0.5,
		y = 0.4
	},
	border = 'single' -- or 'double'
})

nnoremap("<f5>", "<cmd>lua require('FTerm').toggle()<cr>")
tnoremap("<f5>", "<c-\\><c-n><cmd>lua require('FTerm').toggle()<cr>")
