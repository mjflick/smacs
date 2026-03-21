" Vim syntax file
" Language:    Forth
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case ignore

" Comments
syn keyword forthTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region forthComment start=/\\/ end="$" contains=forthTodo
syn region forthComment start=/(\s/ end=/)/ contains=forthTodo

" String literals
syn region forthString start=/s"/ end=/"/
syn region forthString start=/c"/ end=/"/
syn region forthString start=/\."/ end=/"/
syn region forthString start=/abort"/ end=/"/

" Numbers
syn match forthNumber /\<-\?\d\+\>/
syn match forthNumber /\<-\?\d\+\.\d*\>/
syn match forthNumber /\<\$[0-9a-fA-F]\+\>/
syn match forthNumber /\<#\d\+\>/
syn match forthNumber /\<%[01]\+\>/
syn match forthNumber /\<'.\>/

" Colon definitions
syn match forthKeyword /\<:\s\+\w\+/ contains=forthFunction
syn match forthFunction contained /\w\+$/
syn match forthKeyword /\<;\>/

" Keywords and defining words
syn keyword forthKeyword if else then do loop +loop begin again until
syn keyword forthKeyword while repeat case of endof endcase exit recurse
syn keyword forthKeyword does> create variable constant value to is
syn keyword forthKeyword defer immediate postpone literal compile,
syn keyword forthKeyword action-of

" Compile-time words
syn match forthKeyword /\[compile\]/
syn match forthKeyword /\['\]/
syn match forthKeyword /\[char\]/

" Stack manipulation
syn keyword forthStatement dup drop swap over rot -rot nip tuck
syn keyword forthStatement 2dup 2drop 2swap 2over pick roll

" Arithmetic
syn keyword forthOperator + - * / mod /mod */mod negate abs min max
syn keyword forthOperator and or xor invert lshift rshift
syn keyword forthOperator 1+ 1- 2* 2/

" Comparison
syn keyword forthConditional 0= 0< 0> = <> < > <= >= u< u> within between

" Memory
syn keyword forthBuiltin @ ! +! c@ c! cells cell+ chars char+
syn keyword forthBuiltin allot here align aligned , c, fill erase move

" I/O
syn keyword forthBuiltin . .r u. u.r d. d.r .s emit type cr space spaces
syn keyword forthBuiltin accept key key? refill source >in

" Control / execution
syn keyword forthBuiltin execute evaluate parse parse-name find '
syn keyword forthBuiltin >body state ] [
syn keyword forthBuiltin also forth only previous order definitions
syn keyword forthBuiltin vocabulary wordlist search-wordlist
syn keyword forthBuiltin set-order set-current get-order get-current

" String words
syn keyword forthBuiltin count /string compare search blank

" Defining words
syn keyword forthKeyword create does> variable constant value
syn keyword forthKeyword 2variable 2constant defer is action-of
syn keyword forthKeyword marker include included require

" Repeat
syn keyword forthRepeat do loop +loop begin again until while repeat

" Exception
syn keyword forthException catch throw abort abort"

" Return stack
syn keyword forthStatement >r r> r@ 2>r 2r> 2r@

" Double-cell words
syn keyword forthStatement d+ d- dnegate dabs d= d< d0= d0< d>s s>d
syn keyword forthStatement m* um* um/mod sm/rem fm/mod */

" Formatting
syn keyword forthBuiltin <# # #s #> hold sign

hi def link forthComment Comment
hi def link forthTodo Todo
hi def link forthString String
hi def link forthNumber Number
hi def link forthKeyword Keyword
hi def link forthStatement Statement
hi def link forthOperator Operator
hi def link forthConditional Conditional
hi def link forthRepeat Repeat
hi def link forthException Exception
hi def link forthBuiltin Function
hi def link forthFunction Function

let b:current_syntax = "forth"
