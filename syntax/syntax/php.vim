" Vim syntax file
" Language:    PHP
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword phpTodo TODO FIXME XXX NOTE HACK BUG contained
syn match phpLineComment "//.*$" contains=phpTodo
syn match phpLineComment "#.*$" contains=phpTodo
syn region phpBlockComment start="/\*" end="\*/" contains=phpTodo

" Strings
syn region phpStringSingle start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=phpEscape
syn region phpStringDouble start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=phpEscape,phpVariable,phpSpecialChar
syn match phpEscape "\\[nrt\\$\"'0-7xeu]" contained
syn match phpSpecialChar "\\[nrt\\$\"']" contained

" Heredoc / Nowdoc
syn region phpHeredoc start=+<<<\s*\z(\I\i*\)$+ end=+^\z1;$\|^\z1$+ contains=phpVariable,phpEscape,phpSpecialChar
syn region phpNowdoc start=+<<<\s*'\z(\I\i*\)'$+ end=+^\z1;$\|^\z1$+

" Numbers
syn match phpNumber "\<\d\+\>"
syn match phpNumber "\<0[xX][0-9a-fA-F]\+\>"
syn match phpNumber "\<0[bB][01]\+\>"
syn match phpNumber "\<0[oO]\?[0-7]\+\>"
syn match phpNumber "\<\d\+\.\d*\([eE][+-]\?\d\+\)\?\>"
syn match phpNumber "\<\.\d\+\([eE][+-]\?\d\+\)\?\>"
syn match phpNumber "\<\d\+[eE][+-]\?\d\+\>"

" Variables
syn match phpVariable "\$\h\w*" display
syn match phpVariable "\$\$\h\w*" display
syn match phpVariable "\${" display
syn match phpSuperglobal "\$_GET\>\|\$_POST\>\|\$_SERVER\>\|\$_SESSION\>\|\$_COOKIE\>\|\$_REQUEST\>\|\$_FILES\>\|\$_ENV\>\|\$GLOBALS\>" display

" PHP tags
syn match phpTag "<?php\|<?=\|?>" display

" Keywords
syn keyword phpKeyword abstract and as break callable case catch class clone const
syn keyword phpKeyword continue declare default do echo else elseif empty enddeclare
syn keyword phpKeyword endfor endforeach endif endswitch endwhile enum eval exit extends
syn keyword phpKeyword final finally fn for foreach function global goto if implements
syn keyword phpKeyword include include_once instanceof insteadof interface isset list match
syn keyword phpKeyword namespace new or print private protected public readonly require
syn keyword phpKeyword require_once return static switch throw trait try unset use var
syn keyword phpKeyword while xor yield from

" Conditional / Repeat / Exception (more specific groups)
syn keyword phpConditional if else elseif endif switch case default match
syn keyword phpRepeat for foreach while do endfor endforeach endwhile
syn keyword phpException try catch finally throw

" Types
syn keyword phpType array bool callable float int iterable mixed never null object
syn keyword phpType string void true false self parent static

" Operators
syn match phpOperator "[-+*/%&|^~<>=!.?:]"
syn match phpOperator "\.\.\."
syn match phpOperator "=>"
syn match phpOperator "->"
syn match phpOperator "?->"
syn match phpOperator "::"
syn match phpOperator "==="
syn match phpOperator "!=="
syn match phpOperator "<=>"
syn match phpOperator "??"
syn match phpOperator "??="

" Builtins
syn keyword phpBuiltin array_push array_pop array_shift array_unshift array_merge
syn keyword phpBuiltin array_map array_filter array_reduce array_keys array_values
syn keyword phpBuiltin array_unique array_reverse array_slice array_splice count sizeof
syn keyword phpBuiltin sort usort ksort asort in_array array_search implode explode
syn keyword phpBuiltin strlen strpos strrpos substr str_replace str_contains
syn keyword phpBuiltin str_starts_with str_ends_with strtolower strtoupper trim ltrim rtrim
syn keyword phpBuiltin sprintf printf number_format preg_match preg_replace preg_split
syn keyword phpBuiltin json_encode json_decode file_get_contents file_put_contents
syn keyword phpBuiltin fopen fclose fread fwrite fgets file_exists is_file is_dir
syn keyword phpBuiltin mkdir rmdir unlink rename copy glob date time strtotime mktime
syn keyword phpBuiltin isset unset empty var_dump print_r var_export die header
syn keyword phpBuiltin setcookie session_start

" Constants
syn keyword phpConstant TRUE FALSE NULL __FILE__ __LINE__ __DIR__ __FUNCTION__
syn keyword phpConstant __CLASS__ __TRAIT__ __METHOD__ __NAMESPACE__ PHP_EOL
syn keyword phpConstant PHP_INT_MAX PHP_INT_MIN PHP_FLOAT_MAX PHP_FLOAT_MIN
syn keyword phpConstant STDIN STDOUT STDERR PHP_VERSION PHP_OS

" Highlighting
hi def link phpTodo Todo
hi def link phpLineComment Comment
hi def link phpBlockComment Comment
hi def link phpStringSingle String
hi def link phpStringDouble String
hi def link phpHeredoc String
hi def link phpNowdoc String
hi def link phpEscape Special
hi def link phpSpecialChar Special
hi def link phpNumber Number
hi def link phpVariable Identifier
hi def link phpSuperglobal Identifier
hi def link phpTag PreProc
hi def link phpKeyword Keyword
hi def link phpConditional Conditional
hi def link phpRepeat Repeat
hi def link phpException Exception
hi def link phpType Type
hi def link phpOperator Operator
hi def link phpBuiltin Function
hi def link phpConstant Constant

let b:current_syntax = "php"
