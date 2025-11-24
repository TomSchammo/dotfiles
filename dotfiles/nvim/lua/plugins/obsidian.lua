return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	event = {
		"BufReadPre " .. vim.fn.expand("~") .. "/Documents/Obsidian/**.md",
		"BufNewFile " .. vim.fn.expand("~") .. "/Documents/Obsidian/**.md",
	},
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		workspaces = {
			{
				name = "Obsidian Vault",
				path = "~/Documents/Obsidian/",
			},
		},
		legacy_commands = false,
		ui = {
			-- disable ui because a different plugin renders markdown
			enable = false,
		},
	},
}
