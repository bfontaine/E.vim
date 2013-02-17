" Vim syntax file
" Language: E
" Maintainer: Baptiste Fontaine
" URI: http://github.com/bfontaine/E.vim
" Latest Revision: 17 February 2013

if exists("b:current_syntax")
"    finish
endif

" numbers (from Java syntax file)
syn match eNumber "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match eNumber "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
syn match eNumber "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
syn match eNumber "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"

" booleans
syn keyword eBoolean true false

" conditionals
syn keyword eConditional if else switch

syn match eLineComment "#.*"

" guards
syn keyword eGuard int char float64 boolean String void notNull nullOk near vow rcvr pbc Data

let b:current_syntax = "e"

hi def link eBoolean            Boolean
hi def link eConditional        Conditional
hi def link eGuard              Type
hi def link eLineComment        Comment
hi def link eNumber             Number
