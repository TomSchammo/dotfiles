return {
	"tpope/vim-fugitive",
	dependencies = {
		-- Make Git integration prettier
		"mhinz/vim-signify",
	},
	lazy = false,
	keys = {
		{ "<leader>gd", "<cmd>Gdiffsplit<cr>", mode = { "n" }, desc = "Open `git diff` in split window" },
		{ "<leader>gb", "<cmd>Git blame<cr>", mode = { "n" }, desc = "Open `git blame` in a small split window" },
		{ "<leader>gs", "<cmd>G<cr>", mode = { "n" }, desc = "Open vim-fugitive git overview." },
		{ "<leader>ga", "<cmd>Git add %<cr>", mode = { "n" }, desc = "`git add` current file." },
		{ "<leader>gp", "<cmd>Git add -p %<cr>", mode = { "n" }, desc = "`git add -p` current file." },
	},
}
