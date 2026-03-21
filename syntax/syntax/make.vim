" Vim syntax file
" Language:    Makefile
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword makeTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region makeComment start="#" end="$" contains=makeTodo

" Directives
syn keyword makeDirective include sinclude define endef ifdef ifndef
syn keyword makeDirective ifeq ifneq else endif override export unexport
syn keyword makeDirective undefine private vpath
syn match makeDirective /^-include\>/

" Special targets
syn match makeSpecial /^\.\(PHONY\|SUFFIXES\|DEFAULT\|PRECIOUS\|INTERMEDIATE\)\>/
syn match makeSpecial /^\.\(SECONDARY\|SECONDEXPANSION\|DELETE_ON_ERROR\|IGNORE\)\>/
syn match makeSpecial /^\.\(LOW_RESOLUTION_TIME\|SILENT\|EXPORT_ALL_VARIABLES\)\>/
syn match makeSpecial /^\.\(NOTPARALLEL\|ONESHELL\|POSIX\|SHELLFLAGS\)\>/

" Target rules
syn match makeTarget /^[A-Za-z0-9_./%$()][A-Za-z0-9_./%$() \t-]*\ze\s*:[^=]/
syn match makeTarget /^[A-Za-z0-9_./%$()][A-Za-z0-9_./%$() \t-]*\ze\s*:$/

" Rule separator
syn match makeRuleSep /:/

" String literals
syn region makeString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=makeVariable,makeAutoVar
syn region makeString start=+'+ skip=+\\\\\|\\'+ end=+'+

" Variables and references
syn match makeVariable /\$(\w\+)/ contains=makeFunction
syn match makeVariable /\${\w\+}/
syn match makeVariable /\$[A-Za-z@<^?*%+|]/
syn match makeVariable /\$\$/

" Automatic variables
syn match makeAutoVar /\$@/
syn match makeAutoVar /\$</
syn match makeAutoVar /\$\^/
syn match makeAutoVar /\$?/
syn match makeAutoVar /\$\*/
syn match makeAutoVar /\$%/
syn match makeAutoVar /\$+/
syn match makeAutoVar /\$|/
syn match makeAutoVar /\$(@D)/
syn match makeAutoVar /\$(@F)/
syn match makeAutoVar /\$(<D)/
syn match makeAutoVar /\$(<F)/

" Functions
syn keyword makeFunction contained subst patsubst strip findstring filter sort
syn keyword makeFunction contained word wordlist words firstword lastword
syn keyword makeFunction contained dir notdir suffix basename addsuffix addprefix
syn keyword makeFunction contained join wildcard realpath abspath error warning
syn keyword makeFunction contained info shell origin flavor value eval file
syn keyword makeFunction contained call foreach if or and guile
syn match makeFunction contained /filter-out/

" Assignment operators
syn match makeOperator /\(::\?\|[+?!]\)=/

" Line continuation
syn match makeLineCont /\\$/

" Tab-prefixed recipe lines
syn match makeRecipe /^\t.*/

" Shell commands in recipes
syn match makeShellCmd /^\t@/ contained
syn match makeShellCmd /^\t-/ contained

" Numbers
syn match makeNumber /\<\d\+\>/

hi def link makeComment Comment
hi def link makeTodo Todo
hi def link makeDirective PreProc
hi def link makeSpecial PreProc
hi def link makeTarget Function
hi def link makeRuleSep Operator
hi def link makeString String
hi def link makeVariable Identifier
hi def link makeAutoVar Special
hi def link makeFunction Function
hi def link makeOperator Operator
hi def link makeLineCont Special
hi def link makeRecipe Normal
hi def link makeShellCmd Special
hi def link makeNumber Number

let b:current_syntax = "make"
