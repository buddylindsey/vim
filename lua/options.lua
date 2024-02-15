local options = {
    backup = false,
    number = true,
    cursorline = true,
    background = "dark",
    mouse = "a",
    clipboard = "unnamedplus",
    ttyfast = true,
    swapfile = false,
    termguicolors = true,
    tabstop = 4,
    softtabstop = 4,
    expandtab = true,
    shiftwidth = 4,
    autoindent = true,
    wildmode = "longest:list",
    list = true,
    pumheight = 10
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
