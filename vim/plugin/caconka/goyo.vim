let g:goyo_width = 120

augroup markdown
	autocmd Filetype markdown,mkd call SetUpMk()
augroup END

function! SetUpMk()
	" execute `Goyo` if it's not already active
	if !exists('#goyo')
		Goyo
	endif
endfunction
