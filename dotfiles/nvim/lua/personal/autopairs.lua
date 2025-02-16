return {
    "windwp/nvim-autopairs",
    config = {
        function(_, opts)
            -- defualt values at https://github.com/windwp/nvim-autopairs#default-values
            require("nvim-autopairs").setup({
                disable_filetype = { "TelescopePrompt", "vim" },
            })
        end,
    },
}
