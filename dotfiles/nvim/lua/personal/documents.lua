---------------------------------------------------------------
-- Function to compile documents (supports md and tex)
---------------------------------------------------------------

-- TODO this is broken, the ps command does not work that way apparently
--      I can not explain why it appeared to work with markdown, but it does
--      not appear to work with latex
vim.cmd([[
    function Recompile_Document(filename, type)
        let l:out = systemlist("ps -eo command | grep -E 'zathura " . fnamemodify(a:filename, ":r") . ".pdf'")[0]

        " if the pdf is already opened it will be recompiled
        if "zathura " . fnamemodify(a:filename, ":r") . ".pdf" =~ l:out

            echo "DEBUG: Found a running zathura instance"

            " compile markdown to pdf
            if (a:type =~ "md")
                echo "DEBUG: Running commands for markdown files"
                execute system("pandoc --from markdown+footnotes --filter pandoc-fignos -f markdown-implicit_figures " . shellescape(a:filename) . " -s -o " . fnamemodify(a:filename, ":r") . ".pdf")

            " compile latex to pdf and clean directory
            elseif (a:type =~ "tex")
                echo "DEBUG: Running commands for latex files"
                echo "DEBUG: Comping latex..."
                " execute system("pdflatex " . shellescape(a:filename) . " -file-line-error -halt-on-error")
                " execute system("pdflatex " . shellescape(a:filename) . " -file-line-error")
                execute system("latexmk " . shellescape(a:filename) . " -pdf")
                " echo "DEBUG: Cleaning directory..."
                " execute system("rm *.log *.out *.aux")
                " execute system("rm " . fnamemodify(a:filename, ":r") . ".log  " . fnamemodify(a:filename, ":r") . ".fls " . fnamemodify(a:filename, ":r") . ".aux " . fnamemodify(a:filename, ":r") . ".fdb_latexmk")
            else
                echo "ERROR: 'type' has not a valid value"
            endif
        else
            echo "DEBUG: Could not find a running zathura instance for: '" . fnamemodify(a:filename, ":r") . ".pdf'"
            echo l:out
        endif

    endfunction
]])

---------------------------------------------------------------
-- Vim for Markdown
---------------------------------------------------------------

-- compile markdown to pdf and open it in zathura
vim.cmd([[ autocmd BufWritePost *.md silent call Recompile_Document(@%, "md") ]])
vim.cmd(
	[[ autocmd FileType markdown nnoremap <leader><F1> :!pandoc --from markdown+footnotes --filter pandoc-fignos --pdf-engine=xelatex % -s -o "%:r".pdf && zathura "%:r".pdf&<CR> ]]
)
-- TODO
-- autocmd FileType markdown nnoremap <leader><F1> :sp <bar> resize 20 <bar> term pandoc % -s -o "%:r".pdf && zathura "%:p:r".pdf&<CR>
-- -V fontenc=T2A

---------------------------------------------------------------
-- Vim for LaTeX
---------------------------------------------------------------

-- set file type of any file with 'tex' extension to tex (instead of plaintex)
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "*.tex",
	callback = function()
		vim.bo.filetype = "tex"
	end,
})

-- compile tex file to pdf and open it in zathura
-- TODO this is broken
-- autocmd BufWritePost *.tex silent call Recompile_Document(@%, "tex")

-- autocmd FileType tex nnoremap <leader><F1> :!pdflatex % && zathura "%:p:r".pdf&<CR>
vim.cmd([[ autocmd FileType tex nnoremap <leader><F1> :!latexmk % -pdf && zathura "%:p:r".pdf&<CR> ]])
-- TODO
-- autocmd FileType tex nnoremap <leader><F1> :sp <bar> resize 20 <bar> term pdflatex % && zathura "%:p:r".pdf<CR>
