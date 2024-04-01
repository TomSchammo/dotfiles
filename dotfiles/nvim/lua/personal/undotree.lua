return {
    "mbbill/undotree",
    config = function(_, opts)
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

        vim.opt.swapfile = false
        vim.opt.backup = false
        vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undodir"
        vim.opt.undofile = true
    end,
}
