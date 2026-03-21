" Vim syntax file
" Language:    HTML
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case ignore

" Comments
syn region htmlComment start="<!--" end="-->" contains=htmlTodo
syn keyword htmlTodo contained TODO FIXME XXX NOTE HACK BUG

" DOCTYPE
syn region htmlDoctype start="<!DOCTYPE" end=">" keepend

" CDATA sections
syn region htmlCdata start="<!\[CDATA\[" end="\]\]>"

" Strings (attribute values)
syn region htmlString start=+"+ end=+"+ contained
syn region htmlString start=+'+ end=+'+ contained

" Tags
syn region htmlTag start="<[a-zA-Z]" end=">" contains=htmlTagName,htmlArg,htmlString,htmlEqual fold
syn region htmlEndTag start="</[a-zA-Z]" end=">" contains=htmlTagName

" Self-closing tags
syn match htmlEqual "=" contained

" Tag names - structural
syn keyword htmlTagName contained html head body title base meta link
syn keyword htmlTagName contained header footer nav main section article aside
syn keyword htmlTagName contained div span p br hr wbr

" Tag names - headings
syn keyword htmlTagName contained h1 h2 h3 h4 h5 h6

" Tag names - text
syn keyword htmlTagName contained a em strong small sub sup mark del ins
syn keyword htmlTagName contained abbr time pre code blockquote

" Tag names - lists
syn keyword htmlTagName contained ul ol li

" Tag names - tables
syn keyword htmlTagName contained table thead tbody tfoot tr td th
syn keyword htmlTagName contained caption col colgroup

" Tag names - forms
syn keyword htmlTagName contained form input button select option textarea label
syn keyword htmlTagName contained fieldset legend optgroup datalist output
syn keyword htmlTagName contained meter progress

" Tag names - media
syn keyword htmlTagName contained img video audio source picture canvas svg iframe
syn keyword htmlTagName contained figure figcaption map area

" Tag names - scripting
syn keyword htmlTagName contained script style noscript

" Tag names - interactive
syn keyword htmlTagName contained details summary dialog

" Tag names - web components
syn keyword htmlTagName contained template slot

" Attributes - core
syn keyword htmlArg contained id class style title lang dir hidden
syn keyword htmlArg contained tabindex accesskey draggable contenteditable
syn keyword htmlArg contained spellcheck translate

" Attributes - links and resources
syn keyword htmlArg contained src href alt type name value
syn keyword htmlArg contained rel media target download ping hreflang

" Attributes - dimensions
syn keyword htmlArg contained width height

" Attributes - form attributes
syn keyword htmlArg contained action method placeholder required disabled
syn keyword htmlArg contained checked selected readonly multiple autofocus
syn keyword htmlArg contained autocomplete pattern min max step for

" Attributes - meta/head
syn keyword htmlArg contained charset content property

" Attributes - scripting
syn keyword htmlArg contained defer async nomodule nonce

" Attributes - security
syn keyword htmlArg contained crossorigin integrity referrerpolicy sandbox

" Attributes - iframe
syn keyword htmlArg contained allow srcdoc

" Attributes - media loading
syn keyword htmlArg contained loading decoding fetchpriority

" Attributes - ARIA and roles
syn keyword htmlArg contained role

" Attributes - microdata
syn keyword htmlArg contained itemscope itemprop itemtype itemid itemref

" Attributes - web components
syn keyword htmlArg contained slot part exportparts is

" Attributes - misc
syn keyword htmlArg contained enterkeyhint inputmode xmlns

" data-* and aria-* attributes
syn match htmlArg contained "\<data-[a-zA-Z0-9_-]\+\>"
syn match htmlArg contained "\<aria-[a-zA-Z0-9_-]\+\>"

" Entities
syn match htmlEntity "&\w\+;"
syn match htmlEntity "&#\d\+;"
syn match htmlEntity "&#x[0-9a-fA-F]\+;"

" Embedded JavaScript
syn region htmlScript start="<script\>" end="</script>" contains=htmlTag,htmlEndTag,htmlString

" Embedded CSS
syn region htmlStyle start="<style\>" end="</style>" contains=htmlTag,htmlEndTag,htmlString

" Highlighting links
hi def link htmlComment Comment
hi def link htmlTodo Todo
hi def link htmlDoctype PreProc
hi def link htmlCdata Special
hi def link htmlString String
hi def link htmlTag Function
hi def link htmlEndTag Function
hi def link htmlTagName Keyword
hi def link htmlArg Type
hi def link htmlEqual Operator
hi def link htmlEntity Special
hi def link htmlScript Special
hi def link htmlStyle Special

let b:current_syntax = "html"
