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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.bo.expandtab = false    -- keep using tabs (not spaces)
    vim.bo.tabstop = 4          -- display tabs as 4-space wide
    vim.bo.shiftwidth = 4       -- indent/deindent by 4 columns
    vim.bo.softtabstop = 4      -- pressing tab inserts 1 tab, feels like 4 spaces

    -- Optional: remove visual indicator like '>'
    vim.wo.list = false         -- disable visual listchars entirely
    -- OR if you want list enabled but not showing tab indicators:
    -- vim.opt.listchars:remove("tab")
  end
})

