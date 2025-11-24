return {
	"stevearc/conform.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
    lazy = false,
		opts = {
			ensure_installed = {
				"stylua",
				"prettierd",
				"taplo",
				"yapf",
			},
		},
	},
	event = { "BufWritePre" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			yaml = { "prettier" },
			json = { "prettier" },
			python = { "yapf" },
			cpp = { "clang-format" },
			c = { "clang-format" },
			rust = { "rustfmt" },
			["*"] = { "trim_whitespace" },
		},
		formatters = {
			clang_format = {
				prepend_args = {
					"--style='{BasedOnStyle: llvm, ColumnLimit: 100}'",
					"--sort-includes",
				},
			},
		},

		-- Set default options
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}
