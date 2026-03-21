" Vim syntax file
" Language:    YAML
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match yamlComment "#.*$" contains=yamlTodo
syn keyword yamlTodo contained TODO FIXME XXX NOTE HACK BUG

" Directives
syn match yamlDirective "^%YAML\>.*$"
syn match yamlDirective "^%TAG\>.*$"

" Document markers
syn match yamlDocumentMarker "^---\s*$"
syn match yamlDocumentMarker "^\.\.\.\s*$"

" Keys (word before colon, various forms)
syn match yamlKey "^\s*[a-zA-Z0-9_./-]\+\ze\s*:"
syn match yamlKey "^\s*\"[^\"]*\"\ze\s*:"
syn match yamlKey "^\s*'[^']*'\ze\s*:"

" Strings
syn region yamlString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=yamlEscape
syn region yamlString start=+'+ end=+'+

" Escape sequences
syn match yamlEscape contained "\\[\\\"\/bfnrt0 ]"
syn match yamlEscape contained "\\x[0-9a-fA-F]\{2}"
syn match yamlEscape contained "\\u[0-9a-fA-F]\{4}"
syn match yamlEscape contained "\\U[0-9a-fA-F]\{8}"

" Block scalars
syn match yamlBlockScalar "[|>][+-]\?\(\s\+#.*\)\?$"

" Numbers
syn match yamlNumber "\<[+-]\?\d\+\>"
syn match yamlNumber "\<[+-]\?\d\+\.\d*\>"
syn match yamlNumber "\<[+-]\?\d*\.\d\+\>"
syn match yamlNumber "\<[+-]\?\d\+[eE][+-]\?\d\+\>"
syn match yamlNumber "\<[+-]\?\d\+\.\d*[eE][+-]\?\d\+\>"
syn match yamlNumber "\<0x[0-9a-fA-F]\+\>"
syn match yamlNumber "\<0o[0-7]\+\>"
syn match yamlNumber "\<[+-]\?\.\(inf\|Inf\|INF\)\>"
syn match yamlNumber "\<\.\(nan\|NaN\|NAN\)\>"

" Constants - boolean
syn keyword yamlConstant true false yes no on off True False Yes No On Off TRUE FALSE YES NO ON OFF

" Constants - null
syn keyword yamlConstant null Null NULL
syn match yamlConstant "\~"

" Anchors and aliases
syn match yamlAnchor "&[a-zA-Z0-9_.-]\+"
syn match yamlAlias "\*[a-zA-Z0-9_.-]\+"

" Tags
syn match yamlTag "!![a-zA-Z0-9_]\+"
syn match yamlTag "![a-zA-Z0-9_!./:-]*"

" Merge key
syn match yamlMerge "<<\ze\s*:"

" Sequence indicators
syn match yamlSequence "^\s*-\s"

" Highlighting links
hi def link yamlComment Comment
hi def link yamlTodo Todo
hi def link yamlDirective PreProc
hi def link yamlDocumentMarker PreProc
hi def link yamlKey Identifier
hi def link yamlString String
hi def link yamlEscape Special
hi def link yamlBlockScalar Special
hi def link yamlNumber Number
hi def link yamlConstant Constant
hi def link yamlAnchor Label
hi def link yamlAlias Label
hi def link yamlTag Type
hi def link yamlMerge Keyword
hi def link yamlSequence Operator

let b:current_syntax = "yaml"
