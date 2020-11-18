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

function! s:goyo_enter()
	if !exists('#limelight')
		setlocal virtualedit=all
		Limelight
	endif
endfunction

function! s:goyo_leave()
	setlocal virtualedit=
	Bd
	if exists('#limelight')
		Limelight!
	endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
