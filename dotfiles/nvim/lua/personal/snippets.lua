-- load friendly-snips
require("luasnip.loaders.from_vscode").lazy_load()

-- load custom vs-code style snippets
require("luasnip.loaders.from_vscode").load({ paths = { "~/.config/nvim/custom-snippets/vscode" } })

-- load custom lua snippets
require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/custom-snippets/lua" } })

vim.keymap.set("s", "<C-l>", "<cmd>lua require('luasnip').jump(1)<cr>", { noremap = true, silent = true })
vim.keymap.set("s", "<C-k>", "<cmd>lua require('luasnip').jump(-1)<cr>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-l>", "<cmd>lua require('luasnip').jump(1)<cr>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", "<cmd>lua require('luasnip').jump(-1)<cr>", { noremap = true, silent = true })
