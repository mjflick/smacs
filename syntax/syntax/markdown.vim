" Vim syntax file
" Language:    Markdown
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" HTML comments in markdown
syn region markdownComment start="<!--" end="-->" contains=markdownTodo
syn keyword markdownTodo contained TODO FIXME XXX NOTE HACK BUG

" Headers (ATX style)
syn match markdownH1 "^#\s\+.\+$"
syn match markdownH2 "^##\s\+.\+$"
syn match markdownH3 "^###\s\+.\+$"
syn match markdownH4 "^####\s\+.\+$"
syn match markdownH5 "^#####\s\+.\+$"
syn match markdownH6 "^######\s\+.\+$"

" Headers (Setext style)
syn match markdownH1 "^.\+\n=\+\s*$"
syn match markdownH2 "^.\+\n-\+\s*$"

" Bold
syn region markdownBold start="\*\*" end="\*\*"
syn region markdownBold start="__" end="__"

" Italic
syn region markdownItalic start="\*[^ *]"me=e-1 end="\*"
syn region markdownItalic start="_[^ _]"me=e-1 end="_"

" Bold italic
syn region markdownBoldItalic start="\*\*\*" end="\*\*\*"
syn region markdownBoldItalic start="___" end="___"

" Strikethrough
syn region markdownStrike start="\~\~" end="\~\~"

" Inline code
syn region markdownCode start="`[^`]"me=e-1 end="`"
syn region markdownCode start="``" end="``"

" Fenced code blocks
syn region markdownCodeBlock start="^\s*```.*$" end="^\s*```\s*$"
syn region markdownCodeBlock start="^\s*\~\~\~.*$" end="^\s*\~\~\~\s*$"

" Indented code blocks (4 spaces or tab)
syn match markdownCodeIndent "^\(\s\{4}\|\t\).\+$"

" Links
syn region markdownLink start="\[" end=")" contains=markdownLinkText,markdownLinkUrl keepend
syn region markdownLinkText contained start="\[" end="\]"
syn region markdownLinkUrl contained start="(" end=")"

" Reference links
syn match markdownLinkRef "^\s*\[[^\]]\+\]:\s\+.*$"

" Images
syn match markdownImage "!\[.\{-}\](.\{-})"

" Autolinks
syn match markdownAutoLink "<\(https\?\|ftp\)://[^>]\+>"
syn match markdownAutoLink "<[a-zA-Z0-9._%+-]\+@[a-zA-Z0-9.-]\+\.[a-zA-Z]\{2,\}>"

" Blockquotes
syn match markdownBlockquote "^\s*>.\{-}$"

" Unordered lists
syn match markdownListItem "^\s*[-*+]\s\+"

" Ordered lists
syn match markdownListItem "^\s*\d\+[.)]\s\+"

" Task lists
syn match markdownTaskDone "^\s*[-*+]\s\+\[x\]"
syn match markdownTaskTodo "^\s*[-*+]\s\+\[ \]"

" Horizontal rules
syn match markdownHRule "^\s*\(-\s*\)\{3,}$"
syn match markdownHRule "^\s*\(\*\s*\)\{3,}$"
syn match markdownHRule "^\s*\(_\s*\)\{3,}$"

" Tables
syn match markdownTable "|"
syn match markdownTableSep "|\?\s*:*-\+-:*\s*|\?"

" Footnotes
syn match markdownFootnote "\[\^[^\]]\+\]"

" Escaped characters
syn match markdownEscape "\\[\\`*_{}\[\]()#+\-.!|~>]"

" Highlighting links
hi def link markdownComment Comment
hi def link markdownTodo Todo
hi def link markdownH1 Keyword
hi def link markdownH2 Keyword
hi def link markdownH3 Keyword
hi def link markdownH4 Keyword
hi def link markdownH5 Keyword
hi def link markdownH6 Keyword
hi def link markdownBold Statement
hi def link markdownItalic Identifier
hi def link markdownBoldItalic Statement
hi def link markdownStrike Comment
hi def link markdownCode String
hi def link markdownCodeBlock String
hi def link markdownCodeIndent String
hi def link markdownLink Function
hi def link markdownLinkText Function
hi def link markdownLinkUrl Special
hi def link markdownLinkRef Special
hi def link markdownImage Special
hi def link markdownAutoLink Special
hi def link markdownBlockquote Comment
hi def link markdownListItem Operator
hi def link markdownTaskDone Constant
hi def link markdownTaskTodo Type
hi def link markdownHRule PreProc
hi def link markdownTable Operator
hi def link markdownTableSep Operator
hi def link markdownFootnote Label
hi def link markdownEscape Special

let b:current_syntax = "markdown"
