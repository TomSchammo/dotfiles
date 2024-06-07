local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
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
    -- colorscheme
    require("personal.colorscheme"),

    require("personal.comments"),

    require("personal.undotree"),

    -- Mason
    require("personal.mason"),
    require("personal.mason-lspconfig"),

    -- vim-surround
    "tpope/vim-surround",

    -- Vim Man Page
    "vim-utils/vim-man",

    -- Basic Git integration
    "tpope/vim-fugitive",

    -- Make Git integration prettier
    "mhinz/vim-signify",

    -- Telescope for fuzzy finding
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-project.nvim",
    "nvim-telescope/telescope-file-browser.nvim",

    require("personal.treesitter"),
    require("personal.neogen"),

    -- Neovim built-in lsp
    "neovim/nvim-lspconfig",

    -- Neovim built-in lsp autocompletion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",

    -- ltex-ls non standard features
    "barreiroleo/ltex-extra.nvim",

    -- Snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },

    -- Debugging
    -- "mfussenegger/nvim-dap",
    -- "rcarriga/nvim-dap-ui",
    -- "theHamsta/nvim-dap-virtual-text",
    -- "nvim-telescope/telescope-dap.nvim",

    -- python debugging
    -- "mfussenegger/nvim-dap-python",

    -- rust stuff
    "simrat39/rust-tools.nvim",

    -- Autopairs
    "windwp/nvim-autopairs",

    -- Autoformatting
    "mhartington/formatter.nvim",

    -- Codi for scratchpad and virtual text
    "metakirby5/codi.vim",

    "nvim-lualine/lualine.nvim",

    -- vim signature to manage marks
    "kshenoy/vim-signature",

    require("personal.bufferline"),

    { "tpope/vim-obsession", cmd = "Obsession" },

    require("personal.obsidian"),
    require("personal.harpoon"),
}
local opts = {}

require("lazy").setup(plugins, opts)
