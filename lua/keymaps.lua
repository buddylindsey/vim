local utils = require('utils')

-- Add comamnd for opening a floating window
vim.api.nvim_create_user_command('OpenFloatCmd', function(input)
    utils.open_command_in_float(input.args)
end, {nargs = 1})


local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", ",", "<Noop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

keymap("n", "<leader>cs", ":noh<CR>", opts)

vim.keymap.set('n', '<leader>o', function()
    vim.cmd('OpenFloatCmd Oil')
end, {noremap = true, silent = true, desc = "Open Oil in a floating window"})
