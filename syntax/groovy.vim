" Vim syntax file
" Language:	Groovy
" Maintainer:	Alessio Pace <billy.corgan@tiscali.it>
" Version: 	0.1
" URL:		
" Last Change:	25/3/2004

" This is my very first vim script, I hope to have
" done it the right way.
" 
" I must thank the author of java.vim and ruby.vim:
" I copied from them most of the stuff :-)
"
" Relies on java.vim, and adds a few special things
" Those files usually have the extension  *.groovy

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded

" TODO:
" - Maybe reduce some colors (too much coloured :-)
" - Add more keywords (i.e.: *Exception)
"
" HOWTO USE IT
" 1) copy the file in the (global or user) syntax folder of vim 
" 
" 2) add this line:
" au BufNewFile,BufRead *.groovy  setf groovy
" in your .vimrc or in the VIM filetype.vim file 
" [groovy is still not recognized by vim! :-( ]
" 
" 3) open/write a .groovy file :-)
"
" Let me know if you like it so that I can improve it

" Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  " we define it here so that included files can test for it
  let main_syntax='groovy'
endif

" source the java.vim file
if version < 600
  source <sfile>:p:h/java.vim
else
  runtime! syntax/java.vim
endif

" unlet b:current_syntax



syn region  javaString		start=+'+ end=+'+ end=+$+ contains=javaSpecialChar,javaSpecialError,@Spell
syn keyword javaLangClass  	Closure Object MetaMethod GroovyObject
syn keyword javaType		Integer Date Boolean Float String Array Vector List
syn keyword javaOperator        each call inject sort print println as def in
syn match javaOperator		"|[ ,a-zA-Z0-9_*]\+|"
syn match  javaBraces		"[{}]"
syn match  javaBraces		"[\[\]]"
syn match  javaBraces		"[\|]"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_css_syn_inits")
  if version < 508
    let did_css_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink javaLangClass javaExternal
  HiLink javaBraces javaStatement
  delcommand HiLink
endif

let b:current_syntax = "groovy"

" vim: ts=8
