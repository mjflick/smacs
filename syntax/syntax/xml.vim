" Vim syntax file
" Language:    XML
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn region xmlComment start="<!--" end="-->" contains=xmlTodo
syn keyword xmlTodo contained TODO FIXME XXX NOTE HACK BUG

" CDATA sections
syn region xmlCdata start="<!\[CDATA\[" end="\]\]>"

" Processing instructions
syn region xmlProcessing start="<?" end="?>"

" DOCTYPE
syn region xmlDoctype start="<!DOCTYPE" end=">" keepend contains=xmlDoctypeKeyword
syn keyword xmlDoctypeKeyword contained DOCTYPE SYSTEM PUBLIC ENTITY NOTATION ELEMENT ATTLIST

" Strings (attribute values)
syn region xmlString start=+"+ end=+"+ contained
syn region xmlString start=+'+ end=+'+ contained

" Tags
syn region xmlTag start="<[a-zA-Z_:]" end=">" contains=xmlTagName,xmlAttrib,xmlString,xmlEqual,xmlNamespace fold
syn region xmlEndTag start="</[a-zA-Z_:]" end=">" contains=xmlTagName,xmlNamespace
syn match xmlTagSelfClose "/>" contained

" Tag names (with optional namespace prefix)
syn match xmlTagName contained "\<[a-zA-Z_:][a-zA-Z0-9_.:-]*\>"

" Namespace declarations
syn match xmlNamespace contained "\<xmlns\(:[a-zA-Z0-9_-]\+\)\?\>"

" Attributes
syn match xmlAttrib contained "\<[a-zA-Z_:][a-zA-Z0-9_.:-]*\>\ze\s*="

" Attribute equals
syn match xmlEqual contained "="

" Entities
syn match xmlEntity "&[a-zA-Z][a-zA-Z0-9]*;"
syn match xmlEntity "&#\d\+;"
syn match xmlEntity "&#x[0-9a-fA-F]\+;"

" Common predefined entities
syn match xmlEntity "&amp;"
syn match xmlEntity "&lt;"
syn match xmlEntity "&gt;"
syn match xmlEntity "&quot;"
syn match xmlEntity "&apos;"

" Highlighting links
hi def link xmlComment Comment
hi def link xmlTodo Todo
hi def link xmlCdata Special
hi def link xmlProcessing PreProc
hi def link xmlDoctype PreProc
hi def link xmlDoctypeKeyword Keyword
hi def link xmlString String
hi def link xmlTag Function
hi def link xmlEndTag Function
hi def link xmlTagSelfClose Function
hi def link xmlTagName Keyword
hi def link xmlNamespace Type
hi def link xmlAttrib Identifier
hi def link xmlEqual Operator
hi def link xmlEntity Special

let b:current_syntax = "xml"
