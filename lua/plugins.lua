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
        dependencies = { 'nvim-tree/nvim-web-devicons', 'echasnovski/mini.icons' }
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
    { "sbdchd/neoformat" },
    { "tpope/vim-commentary" },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        "michaelrommel/nvim-silicon",
        lazy = true,
        cmd = "Silicon",
        init = function()
            local wk = require("which-key")
            wk.add({
              { "<leader>sc", ":Silicon<CR>", desc = "Snapshot Code" },
            }, {mode = "n"})
        end,
        config = function()
            require("silicon").setup({
                font = "JetBrainsMono Nerd Font=34;Noto Color Emoji=34",
                theme = "gruvbox-dark",
                background = "#009933",
                window_title = function()
                    return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
                end,
                output = function()
                    return "~/Downloads/" .. os.date("!%Y-%m-%dT%H-%M-%S") .. "_code.png"
                end,
            })
        end
    },
    { "vimwiki/vimwiki" },
}

require("lazy").setup(plugins)
