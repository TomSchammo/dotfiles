require("nvim-treesitter.configs").setup({
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = {
        "rust",
        "toml",
        "python",
        "c",
        "cpp",
        "cmake",
        "bash",
        "json",
        "json5",
        "make",
        "markdown",
        "markdown_inline",
        "bibtex",
        "latex",
        "vim",
        "bash",
        "diff",
        "gitcommit",
        "gitignore",
        "gitattributes",
        "git_rebase",
    },

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing
    ignore_install = {},

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- list of language that will be disabled
        disable = { "latex" },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        -- additional_vim_regex_highlighting = { "markdown" },
        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true,
    },
})

vim.cmd([[
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
    set foldlevel=999
]])
