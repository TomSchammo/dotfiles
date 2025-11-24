return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "master",
	build = ":TSUpdate",
	config = function()
		local lang_list = {
			"rust",
			"toml",
			"python",
			"c",
			"cpp",
			"cmake",
			"bash",
			"json",
			"json5",
			"make",
			"markdown",
			"markdown_inline",
			"vim",
			"diff",
			"gitcommit",
			"gitignore",
			"gitattributes",
			"git_rebase",
		}

		require("nvim-treesitter.configs").setup({
			-- One of "all", "maintained" (parsers with maintainers), or a list of languages
			ensure_installed = lang_list,

			-- Install languages synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			-- List of parsers to ignore installing
			ignore_install = {},
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = lang_list,
			callback = function()
				vim.treesitter.start()
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			end,
		})
	end,
}

-- return {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	lazy = false,
-- 	branch = "main",
-- 	build = ":TSUpdate",
-- 	config = function()
-- 		local lang_list = {
-- 			"rust",
-- 			"toml",
-- 			"python",
-- 			"c",
-- 			"cpp",
-- 			"cmake",
-- 			"bash",
-- 			"json",
-- 			"json5",
-- 			"make",
-- 			"markdown",
-- 			"markdown_inline",
-- 			"bibtex",
-- 			"latex",
-- 			"vim",
-- 			"diff",
-- 			"gitcommit",
-- 			"gitignore",
-- 			"gitattributes",
-- 			"git_rebase",
-- 		}
-- 		local ts = require("nvim-treesitter")
-- 		ts.setup({
-- 			-- Directory to install parsers and queries to
-- 			install_dir = vim.fn.stdpath("data") .. "/site",
-- 		})
-- 		print(vim.inspect(require("nvim-treesitter.config").get_installed()))
-- 		local already_installed = require("nvim-treesitter.config").get_installed()
-- 		print(vim.inspect(already_installed))
-- 		local parsers_to_install = vim.iter(lang_list)
-- 			:filter(function(parser)
-- 				return not vim.tbl_contains(already_installed, parser)
-- 			end)
-- 			:totable()
--
-- 		vim.defer_fn(function()
-- 			ts.install({})
-- 		end, 0)
--
-- 		vim.api.nvim_create_autocmd("FileType", {
-- 			pattern = lang_list,
-- 			callback = function()
-- 				vim.treesitter.start()
-- 				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- 			end,
-- 		})
-- 	end,
-- }
