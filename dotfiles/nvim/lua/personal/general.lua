---------------------------------------------------------------
-- General Settings
---------------------------------------------------------------

-- disable sounds
vim.cmd([[ set noerrorbells ]])

-- setting tab size and so on
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- auto indent
vim.opt.smartindent = true

-- displays current line number
vim.opt.nu = true

-- displays line numbers relative to the current one
vim.opt.relativenumber = true

-- no wrap to next line
vim.opt.wrap = false

-- search settings
vim.opt.hlsearch = false
-- vim.opt.incsearch = true

vim.opt.winborder = "rounded"

-- disables --INSERT--
vim.cmd([[ set noshowmode ]])

-- Highlight trailing white space
-- NOTE: This is annoying in Mason (and was not there before I switched to lua I believe, which is weird)
--       I have to figure out how to not highlight trailing whitespace in Mason. Maybe don't do it on read-only buffers?

function highlight_trailing_whitespace()
    if not vim.api.nvim_buf_get_option(0, "ro") and vim.api.nvim_buf_get_option(0, "modifiable") then
        vim.cmd([[ autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red ]])
        vim.cmd([[ autocmd BufWinEnter * match ExtraWhitespace /\s\+$/ ]])
        vim.cmd([[ autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/ ]])
        vim.cmd([[ autocmd InsertLeave * match ExtraWhitespace /\s\+$/ ]])
        vim.cmd([[ autocmd BufWinLeave * call clearmatches() ]])
    end
end

vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
