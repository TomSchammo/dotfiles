"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" remapping <leader> key from '\' to ' '
let mapleader = " "

" remapping <C-\><C-N> (normal mode in terminal) to <Esc>
tnoremap <Esc> <C-\><C-N>

" remapping Ctrl+c to behave exactly like escape in insert mode
inoremap <C-c> <esc>

" remapping <leader>y to copy to clipboard quickly
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" remapping <leader>jp to prettify json
nnoremap  <leader>jp :%!jq<cr>
vnoremap  <leader>jp :%!jq<cr>

" remapping <leader>jc to compact json
nnoremap  <leader>jc :%!jq -c<cr>
vnoremap  <leader>jc :%!jq -c<cr>

" Install Vim Plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugins')

" Testing spellchecker
" NOTE: this makes neovim lag when typing. Uninstalling it made the experience
" much smoother again. If I had to guess I'd say it's the suggestions that
" cause the drop in performance. Either because I also have TabNine running,
" and the combination makes performance suffer, or because the suggestions of
" the plugin itself are causing problems.
" Might either drop or have to investigate.
" Plug 'f3fora/cmp-spell'

" Automatically take care of sessions (and work with tmux-resurrect)
Plug 'tpope/vim-obsession'

" Gruvbox Color Scheme
" Plug 'morhetz/gruvbox'
Plug 'ellisonleao/gruvbox.nvim'

" catppuccin color scheme
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

" NERDCommenter
" Plug 'preservim/nerdcommenter'

Plug 'numToStr/Comment.nvim'

" vim-surround
Plug 'tpope/vim-surround'

" Vim Man Page
Plug 'vim-utils/vim-man'

" Basic Git integration
Plug 'tpope/vim-fugitive'

" Make Git integration prettier
Plug 'mhinz/vim-signify'

" FZF
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

" Telescope for fuzzy finding, replaces fzf
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'danymat/neogen'

" RTags for C++
" Plug 'lyuts/vim-rtags'

" CSS-Color
Plug 'ap/vim-css-color'

" vim-snippets
" Plug 'honza/vim-snippets'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'


" Conquer of Completion for autocompletion
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Neovim built-in lsp
Plug 'neovim/nvim-lspconfig'

" Neovim built-in lsp autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

" debugging
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-telescope/telescope-dap.nvim'

" python debugging
Plug 'mfussenegger/nvim-dap-python'

" rust stuff
Plug 'simrat39/rust-tools.nvim'

" Autopairs
Plug 'windwp/nvim-autopairs'

" Autoformatting
Plug 'Chiel92/vim-autoformat'

" Codi for scratchpad and virtual text
Plug 'metakirby5/codi.vim'

" Tabnine
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

" vim-ariline status bar
" Plug 'vim-airline/vim-airline'

" Themes for vim-ariline
" Plug 'vim-airline/vim-airline-themes'

Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

" vim signature to manage marks
Plug 'kshenoy/vim-signature'

" bufferline
Plug 'nvim-tree/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Signify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Better setting for async update (also works for CoC)
set updatetime=100

set scrolloff=8

"Turn off auto reload for vim-session plugin
let g:session_autosave_periodic = 1
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_autosave_to = 'default'
let g:session_verbose_messages = 0
let g:session_default_to_last = 1
