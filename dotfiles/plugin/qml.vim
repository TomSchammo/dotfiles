"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim for QML
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO syntax highliting and completion

" open qml file
au BufNewFile,BufRead *.qml set filetype=qml
autocmd FileType qml nnoremap <leader><F1> :sp | resize 20 | term qml % <CR>


