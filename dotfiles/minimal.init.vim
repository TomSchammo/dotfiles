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
" Fold settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd FileType c,cpp,java set foldmethod=syntax

autocmd FileType python set foldmethod=indent

" open all folds
autocmd FileType c,cpp,java,python set foldlevel=999


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" remapping <leader> key from '\' to ' '
let mapleader = " "

" remapping <C-\><C-N> (normal mode in terminal) to <Esc>
tnoremap <Esc> <C-\><C-N>

inoremap <C-c> <esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/autoload/plug.vim')

" Gruvbox Color Scheme
Plug 'morhetz/gruvbox'

" vim-surround
Plug 'tpope/vim-surround'

" NERDCommenter
Plug 'preservim/nerdcommenter'

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
" Local changes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable("./.nvimrc")
    " source local nvimrc if it exists
    source ./.nvimrc
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" IP Scan
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" command! Scan execute ":0read !nmap -sP 192.168.178.0/24"
command! Scan execute ":0read !nmap -sP 192.168.178.0/24 | sed -n 0~2p | head -n -1 | cut -d' ' -f5- | awk -F' ' '{print $2, $1}' | sed 's/(//' | sed 's/)/:/'"
