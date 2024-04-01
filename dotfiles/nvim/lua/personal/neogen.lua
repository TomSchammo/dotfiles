return {
    "danymat/neogen",
    cmd = "Neogen",
    keys = "<leader>do",
    config = function(_, _)
        require("neogen").setup({
            enabled = true,
            languages = {
                rust = {
                    template = {
                        annotation_convention = "rustdoc",
                    },
                },
                python = {
                    template = {
                        annotation_convention = "reST",
                    },
                },
                c = {
                    template = {
                        annotation_convention = "doxygen",
                    },
                },
                cpp = {
                    template = {
                        annotation_convention = "doxygen",
                    },
                },
            },
        })

        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<C-l>", require("neogen").jump_next, opts)
        vim.keymap.set("n", "<C-h>", require("neogen").jump_prev, opts)

        vim.keymap.set("n", "<leader>do", require("neogen").generate, { noremap = true })
    end,
}
