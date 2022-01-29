"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lua stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF
-- You don't need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

EOF


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Telescope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <C-p>  <cmd>Telescope find_files<cr>
nnoremap <C-i>  <cmd>Telescope live_grep<cr>
" nnoremap <leader>b  <cmd>Telescope buffers<cr>
command! B execute ":Telescope buffers"

" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

