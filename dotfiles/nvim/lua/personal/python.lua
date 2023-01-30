---------------------------------------------------------------
-- Vim for Python
---------------------------------------------------------------

-- Executes the main file of a python project
-- That file should either be located in the project root,
-- or in the main package
-- If there is no main file, the current file is executed

vim.cmd[[
    function! Exec_py(filename)
        if filereadable("main.py")
            execute "sp | resize 20 | term python3 main.py"

        elseif filereadable("main/main.py")
            execute "sp | resize 20 | term python3 main/main.py"

        else
            execute "sp | resize 20 | term python3 " . shellescape(a:filename)

        endif
    endfunction

    autocmd FileType python nnoremap <leader><F1> :call Exec_py(@%) <CR>
]]
