local status_ok, _ = pcall(require, "nvim-treesitter")
if not status_ok then
    print("nvim-treesitter not installed")
    return
end

require('nvim-treesitter.configs').setup({
    ensure_installed = {
        "c",
        "html",
        "javascript",
        "json",
        "lua",
        "python",
        "rust",
        "sql",
        "terraform",
        "toml",
        "vim",
        "vimdoc",
        "markdown",
        "markdown_inline"
    },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
    },
})

vim.api.nvim_create_autocmd("BufRead", {
    pattern = "*.hcl", -- Matches all files, but you can narrow this down
    callback = function()
        if vim.fn.expand("%:t") == "terragrunt.hcl" then
            vim.bo.filetype = "terraform"
        end
    end,
})
