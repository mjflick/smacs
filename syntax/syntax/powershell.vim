" Vim syntax file
" Language:    PowerShell
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case ignore

" Comments
syn keyword psTodo contained TODO FIXME XXX NOTE HACK BUG
syn match psComment "#.*$" contains=psTodo
syn region psComment start="<#" end="#>" contains=psTodo

" Strings
syn region psString start=+"+ skip=+`"+ end=+"+ contains=psVariable,psEscape,psSubExpression
syn region psString start=+'+ end=+'+
syn region psHereString start=+@"$+ end=+^"@+ contains=psVariable,psEscape,psSubExpression
syn region psHereString start=+@'$+ end=+^'@+

" Escape sequences
syn match psEscape +`[0abefnrtv'"$`]+ contained
syn match psEscape +`u{[0-9a-fA-F]\+}+ contained

" Variables
syn match psVariable "\$\w\+" contains=psBuiltinVar
syn match psVariable "\${\w\+}"
syn match psVariable "\$env:\w\+"
syn match psVariable "\$script:\w\+"
syn match psVariable "\$global:\w\+"
syn match psVariable "\$local:\w\+"
syn match psVariable "\$private:\w\+"
syn match psVariable "\$using:\w\+"

" Subexpressions in strings
syn region psSubExpression start="\$(" end=")" contained contains=ALL

" Built-in variables
syn match psBuiltinVar "\$_\>"
syn match psBuiltinVar "\$PSVersionTable\>"
syn match psBuiltinVar "\$PSScriptRoot\>"
syn match psBuiltinVar "\$PSCommandPath\>"
syn match psBuiltinVar "\$MyInvocation\>"
syn match psBuiltinVar "\$args\>"
syn match psBuiltinVar "\$input\>"
syn match psBuiltinVar "\$Error\>"
syn match psBuiltinVar "\$ErrorActionPreference\>"
syn match psBuiltinVar "\$WarningPreference\>"
syn match psBuiltinVar "\$VerbosePreference\>"
syn match psBuiltinVar "\$DebugPreference\>"
syn match psBuiltinVar "\$InformationPreference\>"
syn match psBuiltinVar "\$ConfirmPreference\>"
syn match psBuiltinVar "\$WhatIfPreference\>"
syn match psBuiltinVar "\$true\>"
syn match psBuiltinVar "\$false\>"
syn match psBuiltinVar "\$null\>"
syn match psBuiltinVar "\$HOME\>"
syn match psBuiltinVar "\$PID\>"
syn match psBuiltinVar "\$PWD\>"
syn match psBuiltinVar "\$Host\>"
syn match psBuiltinVar "\$PSCulture\>"
syn match psBuiltinVar "\$PSUICulture\>"

" Numbers
syn match psNumber "\<\d\+\>"
syn match psNumber "\<0x[0-9a-fA-F]\+\>"
syn match psNumber "\<0b[01]\+\>"
syn match psNumber "\<\d\+\.\d*\([eE][+-]\?\d\+\)\?\>"
syn match psNumber "\<\d\+[eE][+-]\?\d\+\>"
syn match psNumber "\<\d\+\([lL]\|[dD]\|[kK][bB]\|[mM][bB]\|[gG][bB]\|[tT][bB]\|[pP][bB]\)\>"

" Keywords
syn keyword psKeyword begin break catch class continue data define do
syn keyword psKeyword dynamicparam else elseif end enum exit filter finally
syn keyword psKeyword for foreach from function hidden if in inlinescript
syn keyword psKeyword parallel param process return sequence switch throw
syn keyword psKeyword trap try until using var while workflow

" Operators
syn match psOperator "\-eq\>"
syn match psOperator "\-ne\>"
syn match psOperator "\-gt\>"
syn match psOperator "\-lt\>"
syn match psOperator "\-ge\>"
syn match psOperator "\-le\>"
syn match psOperator "\-like\>"
syn match psOperator "\-notlike\>"
syn match psOperator "\-match\>"
syn match psOperator "\-notmatch\>"
syn match psOperator "\-contains\>"
syn match psOperator "\-notcontains\>"
syn match psOperator "\-in\>"
syn match psOperator "\-notin\>"
syn match psOperator "\-replace\>"
syn match psOperator "\-split\>"
syn match psOperator "\-join\>"
syn match psOperator "\-and\>"
syn match psOperator "\-or\>"
syn match psOperator "\-not\>"
syn match psOperator "\-xor\>"
syn match psOperator "\-band\>"
syn match psOperator "\-bor\>"
syn match psOperator "\-bnot\>"
syn match psOperator "\-bxor\>"
syn match psOperator "\-shl\>"
syn match psOperator "\-shr\>"
syn match psOperator "\-is\>"
syn match psOperator "\-isnot\>"
syn match psOperator "\-as\>"
syn match psOperator "\-f\>"
syn match psOperator "[+\-*/%]=\?"
syn match psOperator "++\|--"
syn match psOperator "|\|>\|>>\|2>"
syn match psOperator "=\~\|!\~"

" Types
syn match psType "\[string\]"
syn match psType "\[int\]"
syn match psType "\[long\]"
syn match psType "\[double\]"
syn match psType "\[decimal\]"
syn match psType "\[bool\]"
syn match psType "\[datetime\]"
syn match psType "\[array\]"
syn match psType "\[hashtable\]"
syn match psType "\[psobject\]"
syn match psType "\[pscustomobject\]"
syn match psType "\[void\]"
syn match psType "\[xml\]"
syn match psType "\[regex\]"
syn match psType "\[scriptblock\]"
syn match psType "\[type\]"
syn match psType "\[guid\]"
syn match psType "\[version\]"
syn match psType "\[uri\]"
syn match psType "\[mailaddress\]"
syn match psType "\[ipaddress\]"
syn match psType "\[nullable\]"
syn match psType "\[switch\]"
syn match psType "\[byte\]"
syn match psType "\[char\]"
syn match psType "\[float\]"
syn match psType "\[single\]"
syn match psType "\[timespan\]"

" Cmdlets
syn match psFunction "\<\(Get\|Set\|Add\|Clear\|New\|Remove\|Copy\|Move\|Rename\|Test\|Join\|Split\|Resolve\|Push\|Pop\|Start\|Stop\|Restart\|Import\|Export\|Select\|Where\|ForEach\|Sort\|Group\|Measure\|Compare\|Format\|Out\|Write\|Read\|ConvertTo\|ConvertFrom\|Invoke\|Enter\|Exit\|Send\)-\w\+"

" Highlight links
hi def link psComment Comment
hi def link psTodo Todo
hi def link psString String
hi def link psHereString String
hi def link psEscape Special
hi def link psNumber Number
hi def link psKeyword Keyword
hi def link psOperator Operator
hi def link psType Type
hi def link psFunction Function
hi def link psVariable Identifier
hi def link psBuiltinVar Constant
hi def link psSubExpression Special

let b:current_syntax = "powershell"
