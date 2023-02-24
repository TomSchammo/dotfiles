-- You don't need to set any of these options. These are the default ones. Only
-- the loading is important
require("telescope").setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = ">",
        color_devicons = true,

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        project = {
            base_dirs = {
                "~/Projects/",
            },
        },
        file_browser = {},
    },
})

-- Telescop extensions
require("telescope").load_extension("fzf")
require("telescope").load_extension("project")
require("telescope").load_extension("file_browser")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<C-i>", builtin.live_grep, {})
vim.keymap.set("n", "<C-s>", builtin.lsp_document_symbols, {})

vim.cmd([[ command! B execute ":Telescope buffers" ]])

vim.keymap.set("n", "<leader><leader>p", require("telescope").extensions.project.project, {})
vim.keymap.set("n", "<leader><leader>d", require("telescope").extensions.file_browser.file_browser, {})
