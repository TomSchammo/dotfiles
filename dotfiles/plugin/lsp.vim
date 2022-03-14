lua << EOF

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client)
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})

    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
    vim.keymap.set("n", "ga", vim.lsp.buf.code_action, {buffer=0})
    vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, {buffer=0})
    vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", {buffer=0})
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})

    -- Set autocommands conditional on server_capabilities
    -- TODO doesn't work
    if client.resolved_capabilities.document_highlight then
        vim.cmd [[
            augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]]
    end

end

require'lspconfig'.pyright.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require('lspconfig')['clangd'].setup {
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

    capabilities = capabilities,
    on_attach = on_attach,
}

require('lspconfig')['bashls'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require('rust-tools').setup({

    -- https://github.com/simrat39/rust-tools.nvim
    tools = {
        autoSetHints = true,
        hover_with_actions = true,
        runnables = {
            use_telescope = true
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
            highlight = "Comment"
        },

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
                    importPrefix = "by_self"
                },
                cargo = {
                    allFeatures = true
                },
                checkOnSave = {
                    command = "clippy"
                },
                lens = {
                    references = true,
                    methodReferences = true
                }
            }
        }
    },

})



vim.opt.completeopt = {"menu", "menuone", "noselect"}

local cmp = require('cmp')

cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-k>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-j>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c'}),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c'}),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

    },
    sources = {
        {name = 'nvim_lsp'},
        {name = "cmp_tabnine"},
        {name = "vsnip"},
        {name = "spell", keyword_length = 3},
        {name = "path"},
        {name = 'buffer', keyword_length = 5},
    },
}

vim.diagnostic.config({
    -- disable virtual text
    -- virtual_text = false
})

-- automatically show line diagnostics
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Autopairs
-- require("nvim-autopairs.completion.cmp").setup({
--     map_cr = true,
--     map_complete = true,
--     auto_select = true
-- })

-- Database completion
-- vim.api.nvim_exec([[
-- autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
-- ]], false)
EOF

" autocmd BufWritePre *.rs,*.py,*.c,*.sh,*.json,*.cpp lua vim.lsp.buf.formatting_sync(nil, 200)

set signcolumn=yes
