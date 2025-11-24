return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	dependencies = { "rafamadriz/friendly-snippets", "tomschammo/custom-snippets" },
	keymaps = {
		{
			mode = "s",
			lhs = "<C-l>",
			rhs = "<cmd>lua require('luasnip').jump(1)<cr>",
			opts = { noremap = true, silent = true },
		},
		{
			mode = "s",
			lhs = "<C-k>",
			rhs = "<cmd>lua require('luasnip').jump(-1)<cr>",
			opts = { noremap = true, silent = true },
		},
		{
			mode = "i",
			lhs = "<C-l>",
			rhs = "<cmd>lua require('luasnip').jump(1)<cr>",
			opts = { noremap = true, silent = true },
		},
		{
			mode = "i",
			lhs = "<C-k>",
			rhs = "<cmd>lua require('luasnip').jump(-1)<cr>",
			opts = { noremap = true, silent = true },
		},
	},

	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_lua").lazy_load()
	end,
}
