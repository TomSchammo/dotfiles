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

-- Set filetype of .h files (C header) to 'C' (instead of 'C++')
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.h",
    command = "set filetype=c",
})

vim.cmd([[

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LineWrapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle variable
let g:visual_nav_enabled = 0

function! ToggleVisualNav()
  if g:visual_nav_enabled
    let g:visual_nav_enabled = 0
    set nowrap
    set nolinebreak
    echo "Visual-line navigation DISABLED"
  else
    let g:visual_nav_enabled = 1
    set wrap
    set linebreak
    echo "Visual-line navigation ENABLED"
  endif
endfunction

" Normal mode movement
nnoremap <expr> j g:visual_nav_enabled ? 'gj' . (v:count > 1 ? v:count-1 : '') : 'j'
nnoremap <expr> k g:visual_nav_enabled ? 'gk' . (v:count > 1 ? v:count-1 : '') : 'k'
nnoremap <expr> 0 g:visual_nav_enabled ? 'g0' : '0'
nnoremap <expr> $ g:visual_nav_enabled ? 'g$' : '$'

" Visual mode movement
xnoremap <expr> j g:visual_nav_enabled ? 'gj' : 'j'
xnoremap <expr> k g:visual_nav_enabled ? 'gk' : 'k'
xnoremap <expr> 0 g:visual_nav_enabled ? 'g0' : '0'
xnoremap <expr> $ g:visual_nav_enabled ? 'g$' : '$'

autocmd VimEnter * if g:visual_nav_enabled | set wrap linebreak | endif

autocmd FileType markdown,tex,text let visual_nav_enabled = 1

" Set initial empty buffer to filetype text
" TODO: fix this
" augroup InitialEmptyBuffer
"   autocmd!
"   autocmd VimEnter * if expand('%') == '' && line('$') == 1 && getline(1) == '' | setfiletype text | endif
" augroup END

]])
