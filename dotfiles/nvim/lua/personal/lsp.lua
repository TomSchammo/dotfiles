local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client)
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })

    if vim.bo.filetype == "rust" then
        vim.keymap.set("n", "K", "<cmd>RustHoverActions<cr>", { buffer = 0 })
    else
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    end
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { buffer = 0 })
    vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, { buffer = 0 })
    vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", { buffer = 0 })
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
    vim.keymap.set("n", "<leader>E", "<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<cr>", { buffer = 0 })

    if client.server_capabilities.documentHighlightProvider then
        vim.cmd([[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]])
    end
end

-- Configure LSP servers directly (mason-lspconfig automatically enables installed servers)
local lspconfig = require("lspconfig")

-- Default setup for servers that don't need special configuration
lspconfig.bashls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.jsonls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.marksman.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.taplo.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Specific server configurations
lspconfig.ltex.setup({
    capabilities = capabilities,
    on_attach = function(client)
        require("ltex_extra").setup({
            load_langs = { "en-US", "de-DE" },
            init_check = true,
            path = vim.fn.stdpath("data") .. "/dictionary",
        })
        on_attach(client)
    end,

    settings = {
        ltex = {},
    },
})

lspconfig.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    cmd = {
        "clangd",
        "--background-index",
        "--suggest-missing-includes",
        "--clang-tidy",
        "--header-insertion=iwyu",
    },
    -- Required for lsp-status
    init_options = {
        clangdFileStatus = true,
    },
})

lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        python = {
            pythonPath = vim.fn.exepath("python3.11"),
        },
    },
})

lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

lspconfig.hdl_checker.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "v", "verilog", "vhdl", "systemverilog" },
    cmd = {
        "hdl_checker",
        "--lsp",
    },
    root_dir = function(fname)
        -- will look for the .hdl_checker.config file in parent directory, a
        -- .git directory, or else use the current directory, in that order.
        local util = require("lspconfig").util
        return util.root_pattern(".hdl_checker.config")(fname)
            or util.find_git_ancestor(fname)
            or util.path.dirname(fname)
    end,
    settings = {},
})

-- require("mason-lspconfig").setup({
--     handlers = {
--         -- The first entry (without a key) will be the default handler
--         -- and will be called for each installed server that doesn't have
--         -- a dedicated handler.
--         function(server_name) -- default handler (optional)
--             require("lspconfig")[server_name].setup({
--                 on_attach = on_attach,
--                 capabilities = capabilities,
--             })
--         end,
--         -- Next, you can provide a dedicated handler for specific servers.
--         -- For example, a handler override for the `rust_analyzer`:
--         -- NOTE: for some reason this does not work, which is why I have rust things still externally.
--         --       I'll deal with that later.
--         ["rust_analyzer"] = function()
--             require("rust-tools").setup({
--                 -- https://github.com/simrat39/rust-tools.nvim
--                 tools = {
--                     -- whether to show hover actions inside the hover window
--                     -- this overrides the default hover handler so something like lspsaga.nvim's hover would be overriden by this
--                     -- default: true
--                     autoSetHints = true,
--                     runnables = {
--                         use_telescope = true,
--                     },
--                     inlay_hints = {
--
--                         chainingHints = true,
--                         maxLength = 40,
--                         parameterHints = true,
--                         typeHints = true,
--
--                         only_current_line = false,
--                         show_parameter_hints = true,
--                         parameter_hints_prefix = "> ",
--                         -- parameter_hints_prefix = "<- ",
--
--                         -- TODO this is not a valid argument it appears
--                         -- other_hints_prefix "> ",
--                         max_len_align = false,
--                         right_align = false,
--                         highlight = "Comment",
--                     },
--                 },
--
--                 -- options same as lsp hover / vim.lsp.util.open_floating_preview()
--                 hover_actions = {
--                     -- the border that is used for the hover window
--                     -- see vim.api.nvim_open_win()
--                     border = {
--                         { "╭", "FloatBorder" },
--                         { "─", "FloatBorder" },
--                         { "╮", "FloatBorder" },
--                         { "│", "FloatBorder" },
--                         { "╯", "FloatBorder" },
--                         { "─", "FloatBorder" },
--                         { "╰", "FloatBorder" },
--                         { "│", "FloatBorder" },
--                     },
--
--                     -- whether the hover action window gets automatically focused
--                     -- default: false
--                     auto_focus = false,
--                 },
--
--                 server = {
--                     capabilities = capabilities,
--                     on_attach = on_attach,
--
--                     -- standalone file support
--                     -- setting it to false may improve startup time
--                     standalone = false,
--
--                     settings = {
--                         ["rust-analyzer"] = {
--                             assist = {
--                                 importPrefix = "by_self",
--                             },
--                             cargo = {
--                                 allFeatures = true,
--                             },
--                             checkOnSave = {
--                                 command = "clippy",
--                             },
--                             lens = {
--                                 references = true,
--                                 methodReferences = true,
--                             },
--                         },
--                     },
--                 },
--
--                 -- debugging stuff
--                 dap = {
--                     adapter = {
--                         type = "executable",
--                         command = "lldb-vscode",
--                         name = "rt_lldb",
--                     },
--                 },
--             })
--         end,
--         ["ltex"] = function()
--             require("lspconfig")["ltex"].setup({
--                 capabilities = capabilities,
--                 on_attach = function(client)
--                     require("ltex_extra").setup({
--                         load_langs = { "en-US", "de-DE" },
--                         init_check = true,
--                         path = vim.fn.stdpath("data") .. "/dictionary",
--                     })
--                     on_attach(client)
--                 end,
--
--                 settings = {
--                     ltex = {},
--                 },
--             })
--         end,
--         ["clangd"] = function()
--             require("lspconfig")["clangd"].setup({
--                 on_attach = on_attach,
--                 capabilities = capabilities,
--
--                 cmd = {
--                     "clangd",
--                     "--background-index",
--                     "--suggest-missing-includes",
--                     "--clang-tidy",
--                     "--header-insertion=iwyu",
--                 },
--                 -- Required for lsp-status
--                 init_options = {
--                     clangdFileStatus = true,
--                 },
--             })
--         end,
--         ["pyright"] = function()
--             require("lspconfig")["pyright"].setup({
--                 on_attach = on_attach,
--                 capabilities = capabilities,
--                 settings = {
--                     python = {
--                         pythonPath = vim.fn.exepath("python3.11"),
--                     },
--                 },
--             })
--         end,
--         ["lua_ls"] = function()
--             require("lspconfig")["lua_ls"].setup({
--                 on_attach = on_attach,
--                 capabilities = capabilities,
--                 settings = {
--                     Lua = {
--                         runtime = {
--                             -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--                             version = "LuaJIT",
--                         },
--                         diagnostics = {
--                             -- Get the language server to recognize the `vim` global
--                             globals = { "vim" },
--                         },
--                         workspace = {
--                             -- Make the server aware of Neovim runtime files
--                             library = vim.api.nvim_get_runtime_file("", true),
--                             checkThirdParty = false,
--                         },
--                         -- Do not send telemetry data containing a randomized but unique identifier
--                         telemetry = {
--                             enable = false,
--                         },
--                     },
--                 },
--             })
--         end,
--     },
-- })

require("rust-tools").setup({

    -- https://github.com/simrat39/rust-tools.nvim
    tools = {
        -- whether to show hover actions inside the hover window
        -- this overrides the default hover handler so something like lspsaga.nvim's hover would be overriden by this
        -- default: true
        autoSetHints = true,
        runnables = {
            use_telescope = true,
        },
        inlay_hints = {

            chainingHints = true,
            maxLength = 40,
            parameterHints = true,
            typeHints = true,

            only_current_line = false,
            show_parameter_hints = true,
            parameter_hints_prefix = "> ",
            -- parameter_hints_prefix = "<- ",

            -- TODO this is not a valid argument it appears
            -- other_hints_prefix "> ",
            max_len_align = false,
            right_align = false,
            highlight = "Comment",
        },
    },

    -- options same as lsp hover / vim.lsp.util.open_floating_preview()
    hover_actions = {
        -- the border that is used for the hover window
        -- see vim.api.nvim_open_win()
        border = {
            { "╭", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╮", "FloatBorder" },
            { "│", "FloatBorder" },
            { "╯", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╰", "FloatBorder" },
            { "│", "FloatBorder" },
        },

        -- whether the hover action window gets automatically focused
        -- default: false
        auto_focus = false,
    },

    server = {
        capabilities = capabilities,
        on_attach = on_attach,

        -- standalone file support
        -- setting it to false may improve startup time
        standalone = false,

        settings = {
            ["rust-analyzer"] = {
                assist = {
                    importPrefix = "by_self",
                },
                cargo = {
                    allFeatures = true,
                },
                checkOnSave = {
                    command = "clippy",
                },
                lens = {
                    references = true,
                    methodReferences = true,
                },
            },
        },
    },

    -- debugging stuff
    dap = {
        adapter = {
            type = "executable",
            command = "lldb-vscode",
            name = "rt_lldb",
        },
    },
})

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-j>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        -- ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c'}),
        ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i" }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "spell", keyword_length = 3 },
        { name = "path" },
        { name = "buffer", keyword_length = 5 },
        { name = "nvim_lua" },
    },
})

vim.diagnostic.config({
    -- disable virtual text
    -- virtual_text = false
})
