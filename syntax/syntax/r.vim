" Vim syntax file
" Language:    R
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword rTodo TODO FIXME XXX NOTE HACK BUG contained
syn match rComment "#.*$" contains=rTodo

" Strings
syn region rString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=rEscape
syn region rString start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=rEscape
syn match rEscape "\\[nrt\\\"'abfv0]" contained
syn match rEscape "\\x[0-9a-fA-F]\{1,2}" contained
syn match rEscape "\\u[0-9a-fA-F]\{1,4}" contained
syn match rEscape "\\U[0-9a-fA-F]\{1,8}" contained

" Raw strings (R 4.0+)
syn region rRawString start=+[rR]"(+ end=+)"+ contains=rEscape
syn region rRawString start=+[rR]"\[+ end=+\]"+ contains=rEscape
syn region rRawString start=+[rR]"{+ end=+}"+ contains=rEscape

" Numbers
syn match rNumber "\<\d\+[iL]\?\>"
syn match rNumber "\<0[xX][0-9a-fA-F]\+[iL]\?\>"
syn match rNumber "\<\d\+\.\d*\([eE][+-]\?\d\+\)\?[iL]\?\>"
syn match rNumber "\<\.\d\+\([eE][+-]\?\d\+\)\?[iL]\?\>"
syn match rNumber "\<\d\+[eE][+-]\?\d\+[iL]\?\>"

" Special constants
syn keyword rConstant TRUE FALSE NULL NA Inf NaN T F
syn keyword rConstant NA_integer_ NA_real_ NA_complex_ NA_character_

" Keywords
syn keyword rKeyword if else for while repeat in next break return function
syn keyword rKeyword library require source

" Conditional / Repeat
syn keyword rConditional if else
syn keyword rRepeat for while repeat in next break

" Operators
syn match rOperator "[-+*/%^~<>=!&|:]"
syn match rOperator "<-"
syn match rOperator "<<-"
syn match rOperator "->"
syn match rOperator "->>"
syn match rOperator "%%"
syn match rOperator "%/%"
syn match rOperator "%\*%"
syn match rOperator "%in%"
syn match rOperator "%o%"
syn match rOperator "|>"
syn match rOperator "\.\.\."

" Types
syn keyword rType integer double numeric character logical complex raw list vector
syn keyword rType matrix array data.frame factor environment formula function NULL

" Builtins
syn keyword rBuiltin c length nchar paste paste0 print cat sprintf format substr
syn keyword rBuiltin substring gsub sub grep grepl regexpr nrow ncol dim names
syn keyword rBuiltin colnames rownames head tail str summary class typeof
syn keyword rBuiltin is.null is.na is.numeric is.character is.logical
syn keyword rBuiltin as.numeric as.character as.integer as.logical
syn keyword rBuiltin seq seq_len seq_along rep rev sort order which which.min
syn keyword rBuiltin which.max min max sum prod mean median sd var abs sqrt log
syn keyword rBuiltin log10 log2 exp ceiling floor round trunc range diff cumsum
syn keyword rBuiltin cumprod cummax cummin ifelse switch match unique duplicated
syn keyword rBuiltin table apply sapply lapply vapply tapply mapply do.call
syn keyword rBuiltin Reduce Filter Map Sys.time Sys.sleep system system2
syn keyword rBuiltin file.exists file.path dir.create getwd setwd list.files
syn keyword rBuiltin readLines writeLines read.csv write.csv readRDS saveRDS
syn keyword rBuiltin load save source library require install.packages data
syn keyword rBuiltin exists get assign rm ls environment new.env parent.env
syn keyword rBuiltin tryCatch stop warning message try on.exit options getOption
syn keyword rBuiltin setdiff intersect union

" Exception-like
syn keyword rException tryCatch stop warning try

" Formula
syn match rFormula "\~"

" Function definition
syn match rFunction "\<function\>"

" Special variables
syn match rSpecial "\.\.\."

" Highlighting
hi def link rTodo Todo
hi def link rComment Comment
hi def link rString String
hi def link rRawString String
hi def link rEscape Special
hi def link rNumber Number
hi def link rConstant Constant
hi def link rKeyword Keyword
hi def link rConditional Conditional
hi def link rRepeat Repeat
hi def link rOperator Operator
hi def link rType Type
hi def link rBuiltin Function
hi def link rException Exception
hi def link rFormula Operator
hi def link rFunction Statement
hi def link rSpecial Special

let b:current_syntax = "r"
