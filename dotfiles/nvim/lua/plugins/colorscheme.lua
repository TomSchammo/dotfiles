return {
	"tomschammo/gruvbox.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	priority = 1000,
	config = function(_, _)
		vim.o.background = "dark" -- or "light" for light mode

		-- setup must be called before loading the colorscheme
		-- Default options:
		require("gruvbox").setup({
			undercurl = true,
			underline = true,
			bold = true,
			-- italic seems broken in alacritty + tmux (don't know about alactritty on its own or wezterm)
			italic = {
				strings = false,
				operators = false,
				comments = false,
				folds = false,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			transparent_mode = false,
		})
		vim.cmd("colorscheme gruvbox")

		require("nvim-web-devicons").setup({
			-- your personnal icons can go here (to override)
			-- you can specify color or cterm_color instead of specifying both of them
			-- DevIcon will be appended to `name`
			override = {
				zsh = {
					icon = "",
					color = "#428850",
					cterm_color = "65",
					name = "Zsh",
				},
			},
			-- globally enable default icons (default to false)
			-- will get overriden by `get_icons` option
			default = true,
		})
	end,
}
