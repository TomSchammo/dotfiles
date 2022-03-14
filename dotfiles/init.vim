"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" remapping <leader> key from '\' to ' '
let mapleader = " "

" remapping <C-\><C-N> (normal mode in terminal) to <Esc>
tnoremap <Esc> <C-\><C-N>

" remapping Ctrl+c to behave exactly like escape in insert mode
inoremap <C-c> <esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugins')


" Gruvbox Color Scheme
Plug 'morhetz/gruvbox'

" catppuccin color scheme
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

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

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Signify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Better setting for async update (also works for CoC)
set updatetime=100

set scrolloff=8
