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

" disables --INSERT--
set noshowmode

" Highlight trailing whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" enable integrated spellchecker
set spell

