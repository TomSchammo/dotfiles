"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function to compile documents (supports md and tex)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function Recompile_Document(filename, type)
    let l:out = systemlist("ps -eo command | grep -E 'zathura " . fnamemodify(a:filename, ":r") . ".pdf'")[0]

    " if the pdf is already opened it will be recompiled
    if "zathura " . fnamemodify(a:filename, ":r") . ".pdf" =~ l:out

        " compile markdown to pdf
        if (a:type =~ "pdf")
            execute system("pandoc -f markdown-implicit_figures " . shellescape(a:filename) . " -s -o " . fnamemodify(a:filename, ":r") . ".pdf")

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
autocmd FileType markdown nnoremap <leader><F1> :!pandoc --pdf-engine=xelatex % -s -o "%:r".pdf && zathura "%:r".pdf&<CR>
" TODO
" autocmd FileType markdown nnoremap <leader><F1> :sp <bar> resize 20 <bar> term pandoc % -s -o "%:r".pdf && zathura "%:p:r".pdf&<CR>
" -V fontenc=T2A


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim for LaTeX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" compile tex file to pdf and open it in zathura
autocmd BufWritePost *.tex silent call Recompile_Document(@%, "tex")
autocmd FileType tex nnoremap <leader><F1> :!pdflatex % && zathura "%:p:r".pdf&<CR>
" TODO
" autocmd FileType tex nnoremap <leader><F1> :sp <bar> resize 20 <bar> term pdflatex % && zathura "%:p:r".pdf<CR>

