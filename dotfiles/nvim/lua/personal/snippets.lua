
-- support for vscode style snippets like friendly-snips
require("luasnip.loaders.from_vscode").lazy_load()

vim.keymap.set("s", "<C-l>", "<cmd>lua require('luasnip').jump(1)<cr>", {noremap=true, silent=true})
vim.keymap.set("s", "<C-k>", "<cmd>lua require('luasnip').jump(-1)<cr>", {noremap=true, silent=true})
vim.keymap.set("i", "<C-l>", "<cmd>lua require('luasnip').jump(1)<cr>", {noremap=true, silent=true})
vim.keymap.set("i", "<C-k>", "<cmd>lua require('luasnip').jump(-1)<cr>", {noremap=true, silent=true})

