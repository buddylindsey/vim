local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", ",", "<Noop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

keymap("n", "<leader>cs", ":noh<CR>", opts)

