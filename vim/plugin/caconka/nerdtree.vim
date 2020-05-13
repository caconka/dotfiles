" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! TreeToggle()
	if IsNERDTreeOpen()
		NERDTreeClose
	else
		NERDTreeFind
	endif
endfunction

map <Leader>nt :call TreeToggle()<CR>
