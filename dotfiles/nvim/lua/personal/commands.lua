vim.api.nvim_create_user_command("Hex", function(opts)
    vim.cmd("%!xxd " .. opts.args)
    vim.bo.filetype = "xxd"
end, { nargs = "*", desc = "Turn Vim into a hex editor (use -r to reverse)." })

vim.api.nvim_create_user_command("Clean", function()
    vim.cmd("%s/  *$//g")
end, { desc = "Remove any trailing whitespace." })

vim.api.nvim_create_user_command(
    "CloseAll",
    function()
        vim.cmd("%bd|e#")
    end,
    { desc = "Close all buffers but the current one (technically closes all the buffers and reopens the current one)." }
)

vim.api.nvim_create_user_command("Scan", function()
    vim.cmd(
        "0read !nmap -sP 192.168.178.0/24 | sed -n 0~2p | head -n -1 | cut -d' ' -f5- | awk -F' ' '{print $2, $1}' | sed 's/(//' | sed 's/)/:/'"
    )
end, { desc = "Scan local network for devices using nmap." })
