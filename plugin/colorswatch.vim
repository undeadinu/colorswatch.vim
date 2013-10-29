" Author:  cocopon <cocopon@me.com>
" License: MIT License


let s:save_cpo = &cpo
set cpo&vim


command! -nargs=0 ColorSwatchGenerate call colorswatch#generate()


let g:loaded_colorswatch = 1


let &cpo = s:save_cpo
