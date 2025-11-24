-- set proper language (UTF-8 clipboard supoort)
vim.api.nvim_exec("lang en_US.UTF-8", true)

-- setting tab size and so on
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- auto indent
vim.opt.smartindent = true

-- search settings
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- disable --INSERT--
vim.opt.showmode = false

-- virtual windows
vim.opt.winborder = "rounded"

-- don't scroll to the very bottom before moving the buffer
vim.opt.scrolloff = 8

-- line numbers
vim.opt.nu = true

-- relative line numbers
vim.opt.relativenumber = true

-- map leader before calling lazy
vim.g.mapleader = " "

-- remapping <C-\><C-N> (normal mode in terminal) to <Esc>
vim.keymap.set("t", "<C-><C-N>", "<Esc>", { noremap = true })

-- remapping <leader>y to copy to clipboard quickly
vim.keymap.set("n", "<leader>y", '"+y', { noremap = true })
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true })

-- move highlighted blocks using the move command
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

require("config.lazy")
