set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

" MarkdownPreview with glow
autocmd TermOpen * startinsert
function! s:markdownPreview()
	let l:path=expand('%:p')
	:execute ":vert belowright sb|:term glow -s dark ".l:path." | less"
endfunction
command! MarkdownPreview :call s:markdownPreview()
