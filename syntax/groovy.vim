" Vim syntax file
" Language:	Groovy
" Maintainer:	Alessio Pace <billy.corgan@tiscali.it>
" Version: 	0.1.7
" URL:		
" Last Change:	30/3/2004

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

"
" HOWTO USE IT :
" [groovy is still not recognized by vim! :-( ]
"
" 1) copy the file in the (global or user's $HOME/.vim/syntax/) syntax folder
" 
" 2) add this line to recognize groovy files by filename extension:
"
" au BufNewFile,BufRead *.groovy  setf groovy
" in the global vim filetype.vim file or inside $HOME/.vim/filetype.vim
"
" 3) add this part to recognize by content groovy script (no extension needed :-)
"
"  if did_filetype()
"    finish
"  endif
"  if getline(1) =~ '^#!.*[/\\]groovy\>'
"    setf groovy
"  endif
"
"  in the global scripts.vim file or in $HOME/.vim/scripts.vim
"
" 
" 4) open/write a .groovy file or a groovy script :-)
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

unlet b:current_syntax


" syn match   javaComment		"#.*$"
syn match   javaLineComment      "#.*" contains=@javaCommentSpecial2,javaTodo,@Spell
syn region  javaString		start=+'+ end=+'+ end=+$+ contains=javaSpecialChar,javaSpecialError,@Spell
syn keyword javaLangClass  	Closure Object MetaMethod GroovyObject
syn keyword javaType		Integer Double Date Boolean Float String Array Vector List
syn keyword javaStatement        each call inject sort print println as def in
syn keyword javaStatement        getAt putAt size pop toList getText writeLine eachLine readLines
syn keyword javaStatement        withReader withStream withWriter withPrintWriter write leftShift 
syn keyword javaStatement        withWriterAppend readBytes splitEachLine
syn keyword javaStatement        newInputStream newOutputStream newPrintWriter newReader newWriter 
syn keyword javaStatement        compareTo div minus multiply next plus previous isCase abs round power
syn keyword javaStatement        times step toInteger upto any collect dump every find findAll grep
syn keyword javaStatement        inspect invokeMethods join 
syn keyword javaStatement        getErr getIn getOut waitForOrKill
syn keyword javaStatement        count tokenize asList flatten immutable intersect reverse reverseEach
syn keyword javaStatement        subMap append asWritable eachByte eachLine eachFile 
" syn match javaOperator		"|[ ,a-zA-Z0-9_*]\+|"

" All groovy valid tokens
" syn match javaTokens ";\|,\|<=>\|<>\|:\|:=\|>\|>=\|=\|==\|<\|<=\|!=\|/\|/=\|\.\.|\.\.\.\|\~=\|\~=="
" syn match javaTokens "\*=\|&\|&=\|\*\|->\|\~\|+\|-\|/\|?\|<<<\|>>>\|<<\|>>"

" Must put explicit these ones because java.vim mark them as errors otherwise
syn match javaTokens "<=>\|<>\|==\~"

syn cluster javaTop add=javaTokens

" Mark these as operators
syn match javaOperator "\.\."
syn match javaOperator "<\{2,3}"
syn match javaOperator ">\{2,3}"
syn match javaOperator "->"

syn match javaExternal		'^#!.*[/\\]groovy\>'
syn match javaExceptions        "\<Exception\>\|\<[A-Z]\{1,}[a-zA-Z0-9]*Exception\>"

" Hightlight brackets
" syn match  javaBraces		"[{}]"
" syn match  javaBraces		"[\[\]]"
" syn match  javaBraces		"[\|]"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_css_syn_inits")
  if version < 508
    let did_css_syn_inits = 1
    command -nargs=+ JavaHiLink hi link <args>
  else
    command -nargs=+ JavaHiLink hi def link <args>
  endif
   " JavaHiLink javaLangClass javaExternal
   " JavaHiLink javaBraces javaStatement
   " JavaHiLink javaTokens javaObject
   delcommand JavaHiLink
endif

let b:current_syntax = "groovy"

" vim: ts=8
