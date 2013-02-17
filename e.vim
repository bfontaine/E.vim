" Vim syntax file
" Language: E
" Maintainer: Baptiste Fontaine
" URI: http://github.com/bfontaine/E.vim
" Latest Revision: 17 February 2013

if exists("b:current_syntax")
    finish
endif

syn region eFold start="{" end="}" transparent fold

" numbers (from Java syntax file)
syn match eNumber "\<\-\?\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match eNumber "\-\?\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
syn match eNumber "\<\-\?\d\+[eE][-+]\=\d\+[fFdD]\=\>"
syn match eNumber "\<\-\?\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"
syn match eNumber "\<\-\?Infinity\>"
syn match eNumber "\<NaN\>"

" booleans
syn keyword eBoolean true false

" conditionals
syn keyword eConditional if else switch

" comments
syn match eSheBang "\%^#!.*" display
syn region eLineComment start="#" end=+$+ contains=eTodo,@Spell
syn keyword eTodo contained TODO FIXME XXX

" adapted from Java syntax file
if !exists("e_ignore_javadoc")
  syntax case ignore
  " syntax coloring for javadoc comments (HTML)
  syntax include @javaHtml <sfile>:p:h/html.vim
  unlet b:current_syntax
  " HTML enables spell checking for all text that is not in a syntax item. This
  " is wrong for Java (all identifiers would be spell-checked), so it's undone
  " here.
  syntax spell default

  syn region eDocComment start="/\*\*"  end="\*/" keepend contains=@javaHtml,eDocTags,eDocSeeTag,eTodo

  syn region eDocTags     contained start="{@\(link\|linkplain\|inherit[Dd]oc\|doc[rR]oot\|value\)" end="}"
  syn match  eDocTags     contained "@\(param\|exception\|throws\|since\)\s\+\S\+" contains=eDocParam
  syn match  eDocParam    contained "\s\S\+"
  syn match  eDocTags     contained "@\(version\|author\|return\|deprecated\|serial\|serialField\|serialData\)\>"
  syn region eDocSeeTag   contained matchgroup=eDocTags start="@see\s\+" matchgroup=NONE end="\_."re=e-1 contains=eDocSeeTagParam
  syn match  eDocSeeTagParam  contained @"\_[^"]\+"\|<a\s\+\_.\{-}</a>\|\(\k\|\.\)*\(#\k\+\((\_[^)]\+)\)\=\)\=@ extend
  syntax case match
endif

" guards
syn keyword eGuard int char float64 boolean String void notNull nullOk near vow rcvr pbc Data

" chars & strings
syn match   eSpecialCharError contained "[^']"
syn match   eSpecialChar      contained "\\\([4-9]\d\|[0-3]\d\d\|[\"\\'ntbrf]\|u\x\{4\}\)"
syn region  eString     start=+"+ end=+"+ end=+$+ contains=eSpecialChar,@Spell
syn match   eCharacter  "'[^']*'" contains=eSpecialChar,eSpecialCharError
syn match   eCharacter  "'\\''" contains=eSpecialChar
syn match   eCharacter  "'[^\\]'"

" unicode characters
syn match   eSpecial "\\u\d\{4\}"

" twines
syn region eTwine start=+`+ end=+`+ contains=eSpecialChar,eInterpolation,eInterpolationVar,eMatchVar,@Spell

syn region eInterpolation start="${" end="}" contained contains=ALLBUT
syn match eInterpolationVar "\$[_[:alpha:]][_[:alnum:]]*" contained
syn match eMatchVar "@[_[:alpha:]][_[:alnum:]]*" contained
syn match eMatchVar "@{[_[:alpha:]][_[:alnum:]]*}" contained

" keywords
syn keyword eKeyword var def

let b:current_syntax = "e"

hi def link eBoolean            Boolean

hi def link eCharacter          Character
hi def link eSpecialChar        SpecialChar
hi def link eSpecial            Special

hi def link eConditional        Conditional

hi def link eDocComment         Comment
hi def link eLineComment        Comment
hi def link eTodo               Todo

hi def link eInterpolation      Delimiter

hi def link eSpecialCharError   Error

hi def link eIndentifier        Identifier
hi def link eInterpolationVar   Identifier
hi def link eMatchVar           Identifier

hi def link eKeyword            Keyword

hi def link eNumber             Number

hi def link eSheBang            PreProc

hi def link eString             String
hi def link eTwine              String

hi def link eGuard              Type
