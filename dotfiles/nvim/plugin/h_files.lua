-- Set filetype of .h files (C header) to 'C' (instead of 'C++')
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.h",
	command = "set filetype=c",
})
