return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		completions = {
			lsp = {
				enabled = true,
			},
		},
	},
}
