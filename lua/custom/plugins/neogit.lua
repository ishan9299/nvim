local nnoremap = require('custom.utils').nnoremap
local neogit = require("neogit")
neogit.setup{}

nnoremap("<leader>gg", ":lua require('neogit').open({ kind='vsplit' })<cr>")
