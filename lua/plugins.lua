local fn = vim.fn

local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    'sainnhe/sonokai',
    'lewis6991/gitsigns.nvim',
    'nvim-lua/plenary.nvim',
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    { "github/copilot.vim" },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer" ,
            "hrsh7th/cmp-path" ,
            "hrsh7th/cmp-cmdline" ,
            "hrsh7th/nvim-cmp" ,
            "hrsh7th/cmp-nvim-lua" ,
            {"L3MON4D3/LuaSnip", version="v2.*"},
            "saadparwaiz1/cmp_luasnip",
            { "j-hui/fidget.nvim" },
        }
    },
    { "rafamadriz/friendly-snippets" },
    { "morhetz/gruvbox" },
    { "lewis6991/gitsigns.nvim" },
    { "tpope/vim-fugitive" },
}

require("lazy").setup(plugins)
