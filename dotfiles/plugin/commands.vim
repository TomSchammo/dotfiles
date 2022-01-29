" turn vim into a hex editor (and turn it back with -r)
command! -nargs=* Hex execute "%!xxd <args>" | set ft=xxd

" Remove any trailing whitespace
command! Clean execute ":%s/  *$//g"

" Source init.vim
command! Reload execute ":source ~/.config/nvim/init.vim"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" IP Scan
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" command! Scan execute ":0read !nmap -sP 192.168.178.0/24"
command! Scan execute ":0read !nmap -sP 192.168.178.0/24 | sed -n 0~2p | head -n -1 | cut -d' ' -f5- | awk -F' ' '{print $2, $1}' | sed 's/(//' | sed 's/)/:/'"
