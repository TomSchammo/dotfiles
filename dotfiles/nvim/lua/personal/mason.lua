require("mason").setup()
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
