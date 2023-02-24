require("bufferline").setup({})

vim.keymap.set("n", "<C-w>", ":bdelete<cr>", { noremap = true })
