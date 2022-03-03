let g:goyo_width = 100

"augroup markdown
"	autocmd Filetype markdown,mkd call s:SetUpMk()
"augroup END

function! s:SetUpMk()
	" execute `Goyo` if it's not already active
	if !exists('#goyo')
		Goyo
	endif
endfunction

function! s:goyo_enter()
	setlocal virtualedit=all
	setlocal cursorline
endfunction

function! s:goyo_leave()
	setlocal virtualedit=
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
