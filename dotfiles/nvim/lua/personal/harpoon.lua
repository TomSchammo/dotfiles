return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function(_, opts)
        local harpoon = require("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():append()
        end)
        vim.keymap.set("n", "<leader>m", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        vim.keymap.set("n", "<A-l>", function()
            harpoon:list():next()
        end)
        vim.keymap.set("n", "<A-k>", function()
            harpoon:list():prev()
        end)

        vim.keymap.set("n", "<A-u>", function()
            harpoon:list():select(1)
        end)
        vim.keymap.set("n", "<A-i>", function()
            harpoon:list():select(2)
        end)
        vim.keymap.set("n", "<A-o>", function()
            harpoon:list():select(3)
        end)
        vim.keymap.set("n", "<A-p>", function()
            harpoon:list():select(4)
        end)
    end,
}
