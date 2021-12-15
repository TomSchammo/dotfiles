"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" turn search highliting off
set nohlsearch

" Highlight trailing whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" turn vim into a hex editor (and turn it back with -r)
command! -nargs=* Hex execute "%!xxd <args>"

" Remove any trailing whitespace
command! Clean execute ":%s/  *$//g"

" Source init.vim
command! Reload execute ":source ~/.config/nvim/init.vim"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" remapping <leader> key from '\' to ' '
let mapleader = " "

" remapping <C-\><C-N> (normal mode in terminal) to <Esc>
tnoremap <Esc> <C-\><C-N>

" git
nmap <leader>gd :Gdiffsplit <CR>

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


" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


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

" Spellchecker
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugins')

" Gruvbox Color Scheme
Plug 'morhetz/gruvbox'

" NERDTree
Plug 'preservim/nerdtree'

" NERDCommenter
Plug 'preservim/nerdcommenter'

" vim-surround
Plug 'tpope/vim-surround'

" Vim Man Page
Plug 'vim-utils/vim-man'

" Basic Git integration
Plug 'tpope/vim-fugitive'

" Make Git integration prettier
Plug 'mhinz/vim-signify'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" RTags for C++
Plug 'lyuts/vim-rtags'

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

" disables --INSERT--  and the like
set noshowmode


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline^=%{coc#status()}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright



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
" FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

nnoremap <C-P> :GFiles<CR>


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
  \ 'coc-java',
  \ 'coc-clangd',
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim for C++
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" switching from headers to source files in cpp
nnoremap <leader>h :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" To let vim know where to look for (header) files
let &path.="src/include,/usr/include/AL,/opt/ros/melodic/include"



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim for Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Executes the main file of a python project
" That file should either be located in the project root,
" or in the main package
" If there is no main file, the current file is executed
function! Exec_py(filename)
    if filereadable("main.py")
        execute "sp | resize 20 | term python main.py"

    elseif filereadable("main/main.py")
        execute "sp | resize 20 | term python main/main.py"

    else
        execute "sp | resize 20 | term python " . shellescape(a:filename)

    endif
endfunction

autocmd FileType python nnoremap <leader><F1> :call Exec_py(@%) <CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function to compile documents (supports md and tex)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function Recompile_Document(filename, type)
    let l:out = systemlist("ps -eo command | grep -E 'zathura " . fnamemodify(a:filename, ":r") . ".pdf'")[0]

    " if the pdf is already opened it will be recompiled
    if "zathura " . fnamemodify(a:filename, ":r") . ".pdf" =~ l:out

        " compile markdown to pdf
        if (a:type =~ "pdf")
            execute system("pandoc " . shellescape(a:filename) . " -s -o " . fnamemodify(a:filename, ":r") . ".pdf")

        " compile latex to pdf and clean directory
        elseif (a:type =~ "tex")
            execute system("pdflatex " . shellescape(a:filename) . " -file-line-error -halt-on-error")
            execute system("rm *.log *.out *.aux")
        endif
    endif

endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim for Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" compile markdown to pdf and open it in zathura
autocmd BufWritePost *.md silent call Recompile_Document(@%, "pdf")
autocmd FileType markdown nnoremap <leader><F1> :!pandoc % -s -o "%:r".pdf && zathura "%:r".pdf&<CR>
" TODO
" autocmd FileType markdown nnoremap <leader><F1> :sp <bar> resize 20 <bar> term pandoc % -s -o "%:r".pdf && zathura "%:p:r".pdf&<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim for LaTeX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" compile tex file to pdf and open it in zathura
autocmd BufWritePost *.tex silent call Recompile_Document(@%, "tex")
autocmd FileType tex nnoremap <leader><F1> :!pdflatex % && zathura "%:p:r".pdf&<CR>
" TODO
" autocmd FileType tex nnoremap <leader><F1> :sp <bar> resize 20 <bar> term pdflatex % && zathura "%:p:r".pdf<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim for QML
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO syntax highliting and completion

" open qml file
au BufNewFile,BufRead *.qml set filetype=qml
autocmd FileType qml nnoremap <leader><F1> :sp | resize 20 | term qml % <CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Local changes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable("./.nvimrc")
    " source local nvimrc if it exists
    source ./.nvimrc
endif
