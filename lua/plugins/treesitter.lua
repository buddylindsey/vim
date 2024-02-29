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
--        "terraform",
        "toml",
        "vim",
--        "vimdoc",
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
