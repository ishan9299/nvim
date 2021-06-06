local set_keymap = require("custom.plugins.telescope.configure").set_keymap

require('telescope').setup {
	defaults = {
		color_devicons = false,
	}
}

set_keymap()
