---------------------------------------------------------------
-- Splits and Tabbed Files
---------------------------------------------------------------
vim.cmd([[set splitbelow splitright]])

-- Remap splits navigation to just <leader> + arrow keys
vim.keymap.set("n", "<leader><left>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<leader><down>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<leader><up>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<leader><right>", "<C-w>l", { noremap = true })

-- Also use <leader> + hjkl for split navigation
-- NOTE: most of these don't work because of other keybindings (like <leader>jp)
vim.keymap.set("n", "<leader>h", "<leader><left>", { noremap = false })
vim.keymap.set("n", "<leader>j", "<leader><down>", { noremap = false })
vim.keymap.set("n", "<leader>k", "<leader><up>", { noremap = false })
vim.keymap.set("n", "<leader>l", "<leader><right>", { noremap = false })

-- Make adjusting split sizes a bit more friendly
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize +3<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize -3<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Up>", "<cmd>resize +3<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -3<CR>", { noremap = true, silent = true })

-- Change 2 split windows from vert to horiz or horiz to vert
vim.keymap.set("", "<leader>h", "<C-w>t<C-w>H")
vim.keymap.set("", "<leader>v", "<C-w>t<C-w>K")
