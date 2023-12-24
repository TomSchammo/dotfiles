---------------------------------------------------------------
-- Vim for Flutter
---------------------------------------------------------------

-- autocmd FileType rust nnoremap <leader><F1> :sp | resize 20 | term cargo run <CR>
vim.cmd([[ autocmd FileType dart nnoremap <leader><F1> :FlutterRun<CR> ]])
