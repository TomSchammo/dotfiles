return {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function(_, opts)
        require("bufferline").setup({})

        vim.keymap.set("n", "<C-w><C-w>", ":bdelete<cr>", { noremap = true })
    end,
}
