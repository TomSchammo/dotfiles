"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim for C++
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" switching from headers to source files in cpp
nnoremap <leader>h :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" To let vim know where to look for (header) files
let &path.="src/include,/usr/include/AL,/opt/ros/melodic/include"
