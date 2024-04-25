local utils = require('utils')

-- Add comamnd for opening a floating window
vim.api.nvim_create_user_command('OpenFloatCmd', function(input)
    utils.open_command_in_float(input.args)
end, {nargs = 1})

vim.api.nvim_create_user_command('OpenFloatTerm', function(input)
    utils.open_terminal_command_in_float(input.args)
end, {nargs = 1})

vim.api.nvim_create_user_command('Yazi', function(input)
    utils.open_terminal_command_in_float(input.args)
end, {nargs = 1})

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", ",", "<Noop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

keymap("n", "<leader>cs", ":noh<CR>", opts)
keymap("n", "<leader>tn", ":tabn<CR>", opts)
keymap("n", "<leader>tp", ":tabp<CR>", opts)
keymap("n", "<leader>tc", ":tabe<CR>", opts)

vim.keymap.set('n', '<leader>o', function()
    vim.cmd('OpenFloatCmd Oil')
end, {noremap = true, silent = true, desc = "Open Oil in a floating window"})

vim.keymap.set('n', '<leader>g', function()
    vim.cmd('OpenFloatTerm lazygit')
end, {noremap = true, silent = true, desc = "Open Oil in a floating window"})

vim.keymap.set('n', '<leader>m', function()
    vim.cmd('OpenFloatTerm yazi')
end, {noremap = true, silent = true, desc = "Open Yazi file manager"})

local function pyFmt()
    if vim.bo.filetype == "python" then
        print('Formatting python code')
        vim.cmd('Neoformat black')
        vim.cmd('Neoformat isort')
    end
end

vim.api.nvim_create_user_command('Pyfmt', pyFmt, {nargs = 0})
