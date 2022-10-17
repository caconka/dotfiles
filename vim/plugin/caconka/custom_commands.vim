function! s:wrapToggle()
	if &wrap
		echo "Wrap OFF"
		set nowrap
		nnoremap j j
		nnoremap k k
		nnoremap 0 0
		nnoremap $ $
	else
		echo "Wrap ON"
		set wrap
		set showbreak=↪\  linebreak breakindent
		nnoremap j gj
		nnoremap k gk
		nnoremap 0 g0
		nnoremap $ g$
		onoremap <silent> j gj
		onoremap <silent> k gk
	endif
endfunction
command! WrapToggle :call s:wrapToggle()

" Beautify JSON
function! s:jsonFmt()
	%!python -m json.tool
	%s;^\(\s\+\);\=repeat(' ', len(submatch(0))/2);g
endfunction
command! JsonFmt :call s:jsonFmt()

" Light theme
function! s:lightMode()
	set background=light
	colorscheme onehalflight
	AirlineTheme onehalflight
	let g:fzf_colors={}
endfunction
command! LightMode :call s:lightMode()

" Dark theme
function! s:darkMode()
	set background=dark
	colorscheme nord
	AirlineTheme nord
	let g:fzf_colors = { "bg+": ["bg", "CursorLine", "CursorColumn"] }
endfunction
command! DarkMode :call s:darkMode()

" Git blame
function! s:gitBlame()
	windo !git blame %
endfunction
command! Blame :call s:gitBlame()

" :E to create a new file inside new folder(s)
function s:mkdir(...)
	if !a:0
				\|| isdirectory(a:1)
				\|| filereadable(a:1)
				\|| isdirectory(fnamemodify(a:1, ':p:h'))
		return
	endif
	return mkdir(fnamemodify(a:1, ':p:h'), 'p')
endfunction
command -bang -bar -nargs=? -complete=file E :call s:mkdir(<f-args>) | e<bang> <args>

function! s:editFile(file)
	if a:file ==# 'todo'
		e ~/notes/todo.md
	elseif a:file ==# 'note'
		e ~/notes/note.md
	endif
endfunction
" Edit todo list
command! Todo :call s:editFile('todo')
" Edit notes
command! Note :call s:editFile('note')
