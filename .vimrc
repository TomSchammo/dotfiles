
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

" git
nmap <leader>gd :Gdiffsplit <CR>

" JavaAutocomplete
" nmap <leader>i <Plug>(JavaComplete-Imports-AddMissing)
" nmap <leader>r <Plug>(JavaComplete-Imports-RemoveUnused)
" nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-ClassInFile)


" YouCompleteMe
" fun! GoYCM()
"     " YCM go to definition
"     nnoremap <buffer> <silent> <leader>d :YcmCompleter GoTo<CR> 
"     " YCM go to Reference
"     nnoremap <buffer> <silent> <leader>r :YcmCompleter GoToReferences<CR> 
"     " YCM Rename
"     nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
"     " let g:UltiSnipsExpandTrigger="<c-j>"
"     let g:ycm_use_ultisnips_completer = 0
" endfun




" ConquerOfCompletion
" fun! GoCoc()

" using <down> instead of <C-n> that is mapped to <TAB> to make it work with snippets
inoremap <buffer> <silent><expr> <TAB>
            \ pumvisible() ? "\<down>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()


inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <buffer> <silent><expr> <C-space> coc#refresh()

nmap <buffer> <leader>d <Plug>(coc-definition)
nmap <buffer> <leader>gr <Plug>(coc-references)
nmap <buffer> <leader>rr <Plug>(coc-rename)
nmap <buffer> <leader>i <Plug>(coc-implementation)
" endfun


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

" Java Autocopletion
Plug 'artur-shaik/vim-javacomplete2'

" Conquer of Completion for autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" YouCompleteMe for autocompletion
" Plug 'ycm-core/YouCompleteMe'

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


" TODO maybe customize keybinds as well
" TODO definetely customize keybinds!
" TODO rebind <leader> ci to <leader>cc (and <leader> cc can go)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JavaAutocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disableing default key bindings
let g:JavaComplete_EnableDefaultMappings = 0

" java.util imports are at the top of the file
let g:JavaComplete_ImportOrder = ['java.util']

" Automatically add closing brace
let g:JavaComplete_ClosingBrace = 1

" Compile Java Program
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <F9> :make<Return>:copen<Return>
map <F10> :cprevious<Return>
map <F11> :cnext<Return>

" Python run and debugging F10 for debugging F9 to run
" autocmd Filetype python noremap <buffer> <F10> :exec '!python3 -m pdb' shellescape(@%, 1)<cr>
autocmd Filetype python nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimspector
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimspector_enable_mappings = 'HUMAN'


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
" Start with Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"opening nerdtree on vim start
" autocmd vimenter * NERDTree

" Use JavaAutocoplete for Java
" autocmd FileType java setlocal omnifunc=javacomplete#Complete


" Use YCM for these languages
" autocmd FileType typescript,js,java :call GoYCM()

" Use CoC for these languages
" autocmd FileType cpp,cxx,h,hpp,c,python,tex :call GoCoc()
