au BufRead,BufNewFile *.sv,*.svh setfiletype verilog
au BufRead,BufNewFile *.vh setfiletype verilog
au BufRead,BufNewFile *.v call s:CheckVerilog()

fun! s:CheckVerilog()
  if getline(1) =~# '^\s*\(//\|module\|`\|library\|package\)' || expand("%:e") ==# "v"
    setfiletype verilog
  endif
endfun
