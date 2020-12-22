
" function
hi luaFunction     ctermfg=130

" if then end
hi luaCond         ctermfg=130

" else
hi luaElse         ctermfg=130

" and or
hi luaOperator     ctermfg=130

" local return
hi luaStatement    ctermfg=130

" constant
hi luaConstant     ctermfg=13

" comment
hi luaComment      ctermfg=121

" string 201 133
hi luaString       ctermfg=177

syn match luaFunctionName "\(\<function\>\)\@<=\s\+\S\+\s*(\@="
hi luaFunctionName ctermfg=green

syn match luaFunctionCall "\v\.\zs\w+\ze\("
hi luaFunctionCall ctermfg=cyan

syn match luaMethodCall "\v\:\zs\w+\ze\("
hi luaMethodCall   ctermfg=cyan

syn match luaEq /=/
hi luaEq           ctermfg=130

syn keyword luaSelf _s
hi luaSelf         ctermfg=33



