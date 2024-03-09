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



-- Get silicon to work with neovim
-- Ubuntu/PopOS:
-- sudo apt install libfontconfig-dev libxcb-composite0-dev libharfbuzz-dev
-- cargo install silicon
-- MacOS:
-- brew install silicon
-- Fonts:
-- https://github.com/googlefonts/noto-emoji
-- https://www.nerdfonts.com/font-downloads - JetBrainsMono Nerd Font
