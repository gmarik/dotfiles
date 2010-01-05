function! s:gotoline()
	let file = bufname("%")
	let names =  matchlist( file, '\(.*\):\(\d\+\)')

	if len(names) != 0 && filereadable(names[1])
		exec ":e " . names[1]
		exec ":" . names[2]
	endif

endfunction

autocmd! BufNewFile *:* nested call s:gotoline()

