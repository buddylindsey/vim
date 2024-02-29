-- Needed before doing anything with plugins
require("plugins")

-- Required files for vim settings
require("colorscheme")
require("options")
require("keymaps")

-- Load plugin specific settings
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.copilot")
require("plugins.lualine")
require("plugins.mason")
require("plugins.gitsigns")
require("plugins.neoformat")
