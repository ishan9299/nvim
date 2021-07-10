local execute = vim.cmd
local fn = vim.fn
local g = vim.g

local install_path = fn.stdpath("data").."/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
	execute "packadd packer.nvim"
end

execute "packadd packer.nvim"

require("packer").startup(function()
	use "LnL7/vim-nix"
	use "embark-theme/vim"
	use "glepnir/zephyr-nvim"
	use "godlygeek/tabular"
	use "nvim-treesitter/nvim-treesitter"
	use "nvim-treesitter/playground"
	use "steelsojka/pears.nvim"
	use "tikhomirov/vim-glsl"
	use "tpope/vim-commentary"
	use "tpope/vim-repeat"
	use "tpope/vim-surround"
	use {"wbthomason/packer.nvim", opt=true}
end)

execute("packadd! modus-theme-vim")
execute("packadd! nvim-solarized-lua")
