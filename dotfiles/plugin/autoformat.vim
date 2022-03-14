au BufWrite * :Autoformat

let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0

let g:formatter_yapf_style = 'pep8'
let g:formatters_python = ['yapf']

let g:formatters_rust = ['rustfmt']
let g:formatters_c = ['clang-format']
let g:formatters_cpp = ['clang-format']
" let g:formatters_markdown = ['remark']
