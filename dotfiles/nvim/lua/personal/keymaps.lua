-- remapping <leader> key from '\' to ' '
vim.g.mapleader = " "

-- remapping <C-\><C-N> (normal mode in terminal) to <Esc>
vim.keymap.set("t", "<C-><C-N>", "<Esc>", { noremap = true })

-- remapping Ctrl+c to behave exactly like escape in insert mode
vim.keymap.set("i", "<C-c>", "<Esc>", { noremap = true })

-- remapping <leader>y to copy to clipboard quickly
vim.keymap.set("n", "<leader>y", '"+y', { noremap = true })
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true })

-- remapping <leader>jp to prettify json
vim.keymap.set("n", "<leader>jp", "<cmd>%!jq<cr>", { noremap = true })
vim.keymap.set("v", "<leader>jp", "<cmd>%!jq<cr>", { noremap = true })

-- remapping <leader>jc to compact json
vim.keymap.set("n", "<leader>jc", "<cmd>%!jq -c<cr>", { noremap = true })
vim.keymap.set("v", "<leader>jc", "<cmd>%!jq -c<cr>", { noremap = true })

-- adding keymap for netrw
vim.keymap.set("n", "<leader><S-e>", "<cmd>Explore<cr>", { noremap = true })
