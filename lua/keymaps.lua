local utils = require('utils')

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", ",", "<Noop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

local function createOpenFloatCommand(name, func)
    vim.api.nvim_create_user_command(name, function(input)
        func(input.args)
    end, {nargs = 1})
end
createOpenFloatCommand("OpenFloatCmd", utils.open_command_in_float)
createOpenFloatCommand("OpenFloatTerm", utils.open_terminal_command_in_float)

local function keymapFloatTerm(key, cmd, args, desc)
    vim.keymap.set('n', key, function()
        vim.cmd(cmd .. " " .. args)
    end, {noremap = true, silent = true, desc = desc})
end
keymapFloatTerm("<leader>g", "OpenFloatTerm", "lazygit", "Open lazygit in a floating window")
keymapFloatTerm("<leader>m", "OpenFloatTerm", "yazi", "Open Yazi file manager in a floating window")

keymap("n", "<leader>cs", ":noh<CR>", opts)
keymap("n", "<leader>tn", ":tabn<CR>", opts)
keymap("n", "<leader>tp", ":tabp<CR>", opts)
keymap("n", "<leader>tc", ":tabe<CR>", opts)

local function pyFmt()
    if vim.bo.filetype == "python" then
        print("Formatting python code")
        vim.cmd("Neoformat black")
        vim.cmd("Neoformat isort")
    end
end

vim.api.nvim_create_user_command('Pyfmt', pyFmt, {nargs = 0})
