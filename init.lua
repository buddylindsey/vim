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
require("plugins.oil")



-- Install the following packages to use silicon on Ubuntu
-- sudo apt install libfontconfig-dev libxcb-composite0-dev libharfbuzz-dev
-- cargo install silicon
-- https://github.com/googlefonts/noto-emoji
-- https://www.nerdfonts.com/font-downloads - JetBrainsMono Nerd Font
