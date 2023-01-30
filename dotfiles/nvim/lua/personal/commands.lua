-- turn vim into a hex editor (and turn it back with -r)
vim.cmd[[ command! -nargs=* Hex execute "%!xxd <args>" | set ft=xxd ]]

-- Remove any trailing whitespace
vim.cmd[[ command! Clean execute ":%s/  *$//g" ]]

-- Source init.lua
vim.cmd[[ command! Reload execute ":source ~/.config/nvim/init.lua" ]]


---------------------------------------------------------------
-- IP Scan
---------------------------------------------------------------
-- command! Scan execute ":0read !nmap -sP 192.168.178.0/24"
vim.cmd[[ command! Scan execute ":0read !nmap -sP 192.168.178.0/24 | sed -n 0~2p | head -n -1 | cut -d' ' -f5- | awk -F' ' '{print $2, $1}' | sed 's/(//' | sed 's/)/:/'" ]]
