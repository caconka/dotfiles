" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! TreeToggle()
	if IsNERDTreeOpen()
		NERDTreeClose
	else
		if line("$") == 1 && getline(1) == ""
			NERDTree
		else
			NERDTreeFind
		endif
	endif
endfunction

map <Leader>nt :call TreeToggle()<CR>

let g:NERDTreeWinSize = 45
let g:NERDTreeDirArrowExpandable = '·'
let g:NERDTreeDirArrowCollapsible = '›'
