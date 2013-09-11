" Author:  cocopon <cocopon@me.com>
" License: MIT License


let s:save_cpo = &cpo
set cpo&vim


function! colorswatch#entryset#new(entry_dict)
	let entryset = {}

	let entryset.entry_dict_ = a:entry_dict

	function! entryset.get_all_names() dict
		return keys(self.entry_dict_)
	endfunction

	function! entryset.get_all_original_names() dict
		let result = copy(self.entry_dict_)
		call filter(result, '!v:val.has_link()')
		return result
	endfunction

	function! entryset.get_attrs(name) dict
		let entry = get(self.entry_dict_, a:name, {})
		if empty(entry)
			return entry
		endif

		if entry.has_link()
			return entryset.get_attrs(entry.get_name())
		endif

		return entry.get_attrs()
	endfunction

	return entryset
endfunction


let &cpo = s:save_cpo