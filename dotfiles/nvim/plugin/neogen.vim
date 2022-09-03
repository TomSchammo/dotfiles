lua << EOF
require('neogen').setup {
    enabled = true,
    languages = {
        rust = {
            template = {
                annotation_convention = "rustdoc"
            }
        },
        python = {
            template = {
                annotation_convention = "reST"
            }
        },
        c = {
            template = {
                annotation_convention = "doxygen"
            }
        },
        cpp = {
            template = {
                annotation_convention = "doxygen"
            }
        },
    }
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<C-l>", ":lua require('neogen').jump_next()<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-h>", ":lua require('neogen').jump_prev()<CR>", opts)
EOF

nnoremap <leader>do :Neogen<CR>
