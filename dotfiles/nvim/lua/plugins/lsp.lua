return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",
		"folke/lazydev.nvim",
	},
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- Set up keybindings when LSP attaches using LspAttach autocommand
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local client = vim.lsp.get_client_by_id(ev.data.client_id)
				local bufnr = ev.buf

				vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = bufnr })
				vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = bufnr })

				if vim.bo.filetype == "rust" then
					vim.keymap.set("n", "K", "<cmd>RustHoverActions<cr>", { buffer = bufnr })
				else
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
				end
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
				vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = bufnr })
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr })
				vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { buffer = bufnr })
				vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, { buffer = bufnr })
				vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", { buffer = bufnr })
				vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", { buffer = bufnr })
				vim.keymap.set(
					"n",
					"<leader>E",
					"<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<cr>",
					{ buffer = bufnr }
				)

				if client.server_capabilities.documentHighlightProvider then
					vim.cmd([[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]])
				end
			end,
		})

		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "pyright", "clangd", "bashls", "ltex", "texlab", "marksman", "cmake" },
			handlers = {
				function(server_name)
					-- Get default config from lspconfig
					local config = require("lspconfig.server_configurations")[server_name].default_config

					-- Configure using native API
					vim.lsp.config(server_name, {
						cmd = config.cmd,
						filetypes = config.filetypes,
						root_dir = config.root_dir,
						settings = config.settings,
						capabilities = capabilities,
					})

					vim.lsp.enable(server_name)
				end,
			},
		})
	end,
}
