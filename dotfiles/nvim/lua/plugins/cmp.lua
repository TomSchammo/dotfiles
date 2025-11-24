return {
	"saghen/blink.cmp",
	version = "*",

	opts = {
		keymap = {
			["<K>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-k>"] = { "scroll_documentation_up", "fallback" },
			["<C-j>"] = { "scroll_documentation_down", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<CR>"] = { "accept", "fallback" },
		},

		snippets = { preset = "luasnip" },

		sources = {
			default = { "lsp", "snippets", "path", "buffer" },
		},
	},
}
