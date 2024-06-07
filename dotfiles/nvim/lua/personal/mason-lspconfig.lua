return {
    "williamboman/mason-lspconfig.nvim",
    config = function(_, opts)
        require("mason-lspconfig").setup({
            ensure_instsalled = {
                -- "rust_analyzer",
                "clangd",
                "bashls",
                "jsonls",
                "ltex",
                "texlab",
                "marksman",
                "pyright",
                "taplo",
                "lua_ls",
                "nil_ls",
            },
        })
    end,
}
