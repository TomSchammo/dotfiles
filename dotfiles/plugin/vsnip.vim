" let g:vsnip_snippet_dir = "~/.config/nvim/vsnip-snippets"
let g:vsnip_snippet_dir = "~/.config/nvim/friendly-snippets/snippets/"

" Jump forward or backward
" NOTE <C-n> should work as well if I can't get used to C-l, C-h
imap <expr> <C-l> vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-l>'
smap <expr> <C-l> vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-l>'
imap <expr> <C-h> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-h>'
smap <expr> <C-h> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-h>'
