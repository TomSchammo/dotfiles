
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" basic syntax highliting
syntax on

" disable sounds
set noerrorbells


" setting tab size and so on
set tabstop=4
set softtabstop=4
set shiftwidth=4

" a tab is converted to spaces
set expandtab

" auto indent
set smartindent

" displays current line number
set nu

" displays line numbers relative to the current one
set relativenumber

" no wrap to next line
set nowrap

" case sensitive searching
set smartcase

" incremental search
set incsearch


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim
let mapleader = " " " remapping <leader> key from '\' to ' '

" emmet
let g:user_emmet_leader_key='<C-Q>' " trigger key redifened to crtl-Q instead of ctrl-Y

" git
nmap <leader>gd :Gdiffsplit <CR>


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


" Abort completion if backspace is pressed
function! s:check_back_space() abort
    let col = col('.') -1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction



" CoC-Snippets
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<TAB>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" 
" 
""  let g:coc_snippet_next = '<tab>'


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



" NERDTree
nnoremap <silent> <leader>n :NERDTree<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Gruvbox Color Scheme
Plug 'morhetz/gruvbox'

" NERDTree
Plug 'preservim/nerdtree'

" NERDCommenter
Plug 'preservim/nerdcommenter'

" Vim Man Page
Plug 'vim-utils/vim-man'

" Basic Git integration
Plug 'tpope/vim-fugitive'

" Make Git integration prettier
Plug 'mhinz/vim-signify'

" RipGrep
Plug 'jremmen/vim-ripgrep'

" CTRL-P
Plug 'kien/ctrlp.vim'

" RTags for C++
Plug 'lyuts/vim-rtags'

" emmet
Plug 'mattn/emmet-vim'

" CSS-Color
Plug 'ap/vim-css-color'

" vim-snippets
Plug 'honza/vim-snippets'

" Conquer of Completion for autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Vimspector debugger
Plug 'puremourning/vimspector'

" vim-ariline status bar
Plug 'vim-airline/vim-airline'

" Themes for vim-ariline
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual changes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set colorscheme
colorscheme gruvbox
set background=dark

" set colorscheme for status bar
let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1
let g:airline_detect_spell=1
let g:airline_detect_spelllang=1

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_branch = ''
let g:airline_readonly = ''
let g:airline_linenr = '☰'
let g:airline_maxlinenr = ''
let g:airline_dirty='⚡'

" disables --INSERT--  and the like
set noshowmode

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set statusline^=%{coc#status()}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright


" Remap splits navigation to just CTRL + hjkl
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l


" Remap splits navigation to just <leader> + arrow keys
nnoremap <leader><left> <C-w>h
nnoremap <leader><down> <C-w>j
nnoremap <leader><up> <C-w>k
nnoremap <leader><right> <C-w>l


" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>h <C-w>t<C-w>H
map <Leader>v <C-w>t<C-w>K



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Remapping <leader>cc to use toggle comments instead (I just need that gone)
map <leader>ci <plug>NERDCommenterComment

" Mapping toggle comment individually (former <leader>ci) to <leader>cc
map <leader>cc <plug>NERDCommenterInvert



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimspector
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
autocmd Filetype java nmap <leader>dd :CocCommand java.debug.vimspector.start<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RipGrep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('rg')
    let g:rg_derive_root='true'
    let g:rg_highlight = 'true'
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRL-P
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_use_caching = 0

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Signify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Better setting for async update (also works for CoC)
set updatetime=100



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
  \ 'coc-marketplace',
  \ 'coc-json',
  \ 'coc-yaml',
  \ 'coc-xml',
  \ 'coc-pairs',
  \ 'coc-python',
  \ 'coc-java',
  \ 'coc-clangd',
  \ 'coc-snippets',
  \ 'coc-vimlsp',
  \ 'coc-texlab',
  \ 'coc-html',
  \ 'coc-css'
  \ ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim for Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Executes the main file of a python project
" That file should either be located in the project root,
" or in the main package
" If there is no main file, the current file is executed
function Exec_py(filename)
    if filereadable("main.py")
        execute "!python3 main.py"

    elseif filereadable("main/main.py")
        execute "!python3 main/main.py"

    else
        execute "!python3 " . shellescape(a:filename)

    endif
endfunction

autocmd FileType python nnoremap <leader><F1> :call Exec_py(@%) <CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim for Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" compile markdown to pdf and open it in the browser
autocmd FileType markdown nnoremap <leader><F1> :!pandoc % -s -o "%:r".pdf & firefox --new-window "%:p:r".pdf<CR>

