return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function(_, opts)
        require("bufferline").setup({})
    end,
    keys = {
        { "<C-w><C-w>", "<cmd>bdelete<cr>", mode = { "n" }, opts = { noremap = true }, desc = "Close current buffer." },
    },
}
