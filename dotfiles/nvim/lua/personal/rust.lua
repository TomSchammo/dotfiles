---------------------------------------------------------------
-- Vim for Rust
---------------------------------------------------------------

-- autocmd FileType rust nnoremap <leader><F1> :sp | resize 20 | term cargo run <CR>
vim.cmd[[ autocmd FileType rust nnoremap <leader><F1> :!cargo run<CR> ]]


