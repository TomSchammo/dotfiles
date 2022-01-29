"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Quickfix Suggestion
nmap <leader>qf  <Plug>(coc-fix-current)


" Spellchecker
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Disable warning that node is not up to date
let g:coc_disable_startup_warning = 1

" using <down> instead of <C-n> that is mapped to <TAB> to make it work with snippets
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<down>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()


inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-space> coc#refresh()

nmap <leader>d <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>i <Plug>(coc-implementation)

nmap <leader>s :CocSearch


" Abort completion if backspace is pressed
function! s:check_back_space() abort
    let col = col('.') -1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction


" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
  \ 'coc-marketplace',
  \ 'coc-json',
  \ 'coc-yaml',
  \ 'coc-xml',
  \ 'coc-pairs',
  \ 'coc-java',
  \ 'coc-clangd',
  \ 'coc-rust-analyzer',
  \ 'coc-cmake',
  \ 'coc-snippets',
  \ 'coc-vimlsp',
  \ 'coc-texlab',
  \ 'coc-html',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-spell-checker',
  \ 'coc-cspell-dicts'
  \ ]


