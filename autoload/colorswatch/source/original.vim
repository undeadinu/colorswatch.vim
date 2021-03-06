" Author:  cocopon <cocopon@me.com>
" License: MIT License


let s:save_cpo = &cpo
set cpo&vim


" A source that collects original (not a link) highlight groups.
function! colorswatch#source#original#collect() abort
	let entries = colorswatch#hi_reader#read()
	let original_entries = copy(entries)
	call filter(original_entries, '!v:val.has_link()')
	call sort(original_entries, 'colorswatch#entry_sorter#by_name')
	return original_entries
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
