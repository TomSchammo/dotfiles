set relativenumber
set tabstop=4 shiftwidth=4 softtabstop=0 expandtab smarttab
"setlocal spell spelllang=en_us

set nocp
set nocompatible
set autoindent
set smartindent



" dunno what this does
"inoremap <M-o>       <Esc>o
"inoremap <C-j>       <Down>

let g:ragtag_global_maps = 1

" auto closing html tags
"iabbrev ,/ </<C-X><C-O>
"iabbrev <// </<C-X><C-O>

" remapping ctrl-O ctrl-X to ctrl-space
"imap <C-Space> <C-X><C-O>

set hidden

syntax on

if version >= 600
    filetype plugin on
endif

augroup VimStartup:
    au!
    au VimEnter * if expand("%")  == "" | e . | endif
augroup END

set path+=**
set wildmenu 

"for vim-apt (vim plugin manager) (using vundle now)
"execute pathogen#infect()
"call pathogen#helptags()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual changes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox
set background=dark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim
let mapleader = "," " remapping <leader> key from '\' to ','


" emmet
let g:user_emmet_leader_key='<C-Q>' " trigger key redifened to crtl-Q instead of ctrl-Y


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Kite "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" " Add kite support for python and go
" let g:kite_supported_languages = ['python', 'go']
" 
" " Tab can be used to autocomplete
" let g:kite_tab_complete=1
" 
" " turn off snippets
" " let g:kite_snippets=0
" 
" " show the popup menu even when there is only 1 match
" set completeopt+=menuone
" 
" " don't insert any text until user chooses a match
" set completeopt+=noinsert
" 
" " don't insert the longest common text
" set completeopt-=longest
" 
" " add documentation preview
" set completeopt+=preview
" 
" " preview window is closed after insertion
" autocmd CompleteDone * if !pumvisible() | pclose | endif
" 
" " if vim beeps during completion
" set belloff+=ctrlg  
" 
" 
" set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
" set laststatus=2  " always display the status line



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" :PluginInstall to install plugins or 
" vim +PluginInstall +qall from command line
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/plugins')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" NERDTree
Plugin 'preservim/nerdtree'

" emmet
Plugin 'mattn/emmet-vim'

" CSS-Color
Plugin 'ap/vim-css-color'

" Python (test)
Plugin 'vim-python/python-syntax'

" VimWiki
Plugin 'vimwiki/vimwiki'

" " CoC Vim
" Plugin 'neoclide/coc.nvim'

call vundle#end()            " required
filetype plugin indent on    " required




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimWiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/.vim/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Removes pipes | that act as seperators on splits
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fillchars+=vert:\ 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>


" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ??? https://stackoverflow.com/questions/563616/vim-and-ctags-tips-and-tricks
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Setting tags file location
set tags=/home/tom/.vim/tags


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" start with vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"opening nerdtree on vim start
autocmd vimenter * NERDTree


