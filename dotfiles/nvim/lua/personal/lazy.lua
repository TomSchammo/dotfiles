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
    "ellisonleao/gruvbox.nvim",
    -- 'kyazdani42/nvim-web-devicons',

    -- comment.nvim
    "numToStr/Comment.nvim",

    -- Mason
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

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

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "danymat/neogen", cmd = "Neogen", keys = "<leader>do" },

    -- Neovim built-in lsp
    "neovim/nvim-lspconfig",

    -- Neovim built-in lsp autocompletion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",

    -- Snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },

    -- Debugging
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",

    -- python debugging
    "mfussenegger/nvim-dap-python",

    -- rust stuff
    "simrat39/rust-tools.nvim",

    -- Autopairs
    "windwp/nvim-autopairs",

    -- Autoformatting
    "mhartington/formatter.nvim",

    -- Codi for scratchpad and virtual text
    "metakirby5/codi.vim",

    -- Tabnine
    { "tzachar/cmp-tabnine", build = "./install.sh" },

    "nvim-lualine/lualine.nvim",

    -- vim signature to manage marks
    "kshenoy/vim-signature",

    -- bufferline
    { "akinsho/bufferline.nvim", version = "v3.*", dependencies = "nvim-tree/nvim-web-devicons" },

    { "tpope/vim-obsession", cmd = "Obsession" },
}
local opts = {}

require("lazy").setup(plugins, opts)
