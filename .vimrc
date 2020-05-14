
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

" displays numbers relative to the current one
set relativenumber

" no wrap to next line
set nowrap

" case sensitive searching (?)
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


" JavaAutocomplete
nmap <leader>i <Plug>(JavaComplete-Imports-AddMissing)
nmap <leader>r <Plug>(JavaComplete-Imports-RemoveUnused)
nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-ClassInFile)



" YouCompleteMe
fun! GoYCM()
    " YCM go to definition
    nnoremap <buffer> <silent> <leader>d :YcmCompleter GoTo<CR> 
    " YCM go to Reference
    nnoremap <buffer> <silent> <leader>r :YcmCompleter GoToReferences<CR> 
    " YCM Rename
    nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
endfun



" Idk
function! s:check_back_space() abort
    let col = col('.') -1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction



" ConquerOfCompletion
fun! GoCoc()
    inoremap <buffer> <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()

    inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    inoremap <buffer> <silent><expr> <C-space> coc#refresh()

    nmap <buffer> <leader>d <Plug>(coc-definition)
    nmap <buffer> <leader>r <Plug>(coc-references)
    nmap <buffer> <leader>i <Plug>(coc-implementation)
endfun

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

" Vim Man Page
Plug 'vim-utils/vim-man'

" Basic Git integration
Plug 'tpope/vim-fugitive'

" Make Git integration prettier
Plug 'mhinz/vim-signify'

" RipGrep
Plug 'jremmen/vim-ripgrep'

" CTRL-P
" Plug 'ctrlpvim/ctrlp.vim'

Plug 'kien/ctrlp.vim'

" RTags for C++
Plug 'lyuts/vim-rtags'

" emmet
Plug 'mattn/emmet-vim'

" CSS-Color
Plug 'ap/vim-css-color'

" Java Autocopletion
Plug 'artur-shaik/vim-javacomplete2'

" Conquer of Completion for autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" YouCompleteMe for autocompletion
Plug 'ycm-core/YouCompleteMe'


call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual changes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox
set background=dark

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 



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
" JavaAutocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disableing default key bindings
let g:JavaComplete_EnableDefaultMappings = 0

" java.util imports are at the top of the file
let g:JavaComplete_ImportOrder = ['java.util']

" Automatically add closing brace
let g:JavaComplete_ClosingBrace = 1



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
" Better setting for async update
set updatetime=100



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start with Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"opening nerdtree on vim start
autocmd vimenter * NERDTree

 " Use JavaAutocoplete for Java
autocmd FileType java setlocal omnifunc=javacomplete#Complete


" Use YCM for these languages
autocmd FileType typescript,js :call GoYCM()

" Use CoC for these languages
autocmd FileType cpp,cxx,h,hpp,c,py,tex :call GoCoc()
