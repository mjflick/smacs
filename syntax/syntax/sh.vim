" Vim syntax file
" Language:    Shell/Bash
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match shComment "#.*$" contains=shTodo
syn keyword shTodo contained TODO FIXME XXX NOTE HACK BUG

" Strings
syn region shSingleQuote start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=@Spell
syn region shDoubleQuote start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=shVariable,shSpecialChar,shCommandSub,shBacktick,shEscape
syn match shEscape +\\[\\'"abefnrtv$`]+ contained
syn match shSpecialChar +\\[0-7]\{1,3\}+ contained
syn match shSpecialChar +\\x[0-9a-fA-F]\{1,2\}+ contained
syn match shSpecialChar +\\u[0-9a-fA-F]\{1,4\}+ contained

" Heredocs
syn region shHeredoc matchgroup=shHeredocDelim start=+<<\s*\z(\w\+\)+ end=+^\z1$+ contains=shVariable,shCommandSub,shBacktick
syn region shHeredoc matchgroup=shHeredocDelim start=+<<\s*'\z(\w\+\)'+ end=+^\z1$+
syn region shHeredoc matchgroup=shHeredocDelim start=+<<\s*"\z(\w\+\)"+ end=+^\z1$+ contains=shVariable,shCommandSub,shBacktick
syn region shHeredoc matchgroup=shHeredocDelim start=+<<-\s*\z(\w\+\)+ end=+^\s*\z1$+ contains=shVariable,shCommandSub,shBacktick
syn region shHeredoc matchgroup=shHeredocDelim start=+<<-\s*'\z(\w\+\)'+ end=+^\s*\z1$+

" Command substitution
syn region shCommandSub matchgroup=shCmdSubRegion start=+\$(+ end=+)+ contains=TOP
syn region shBacktick start=+`+ end=+`+ contains=shVariable,shSpecialChar

" Variables
syn match shVariable +\$\w\++ contained
syn match shVariable +\$[?$!#@*0-9]+ contained
syn match shVariable +\${[^}]*}+ contains=shVariable
syn match shDeref +\$\w\++
syn match shDeref +\$[?$!#@*0-9]+
syn match shDeref +\${[^}]*}+

" Arithmetic
syn region shArithmetic matchgroup=shArithRegion start=+\$((+ end=+))+ contains=shDeref,shNumber

" Test brackets
syn region shTestBracket matchgroup=shTestOp start=+\[\[+ end=+\]\]+ contains=TOP
syn region shTestBracket matchgroup=shTestOp start=+\[+ end=+\]+ contains=TOP

" Numbers
syn match shNumber +\<\d\++
syn match shNumber +\<0[xX][0-9a-fA-F]\++
syn match shNumber +\<0[oO]\?[0-7]\++
syn match shNumber +\<0[bB][01]\++

" Operators
syn match shOperator +[|&;><]+
syn match shOperator +||+
syn match shOperator +&&+
syn match shOperator +;;+
syn match shOperator +>>=\?+
syn match shOperator +<<=\?+
syn match shOperator +|&+
syn match shOperator +>|+
syn match shOperator +&>+
syn match shOperator +&>>+

" Test operators
syn match shTestOp +\s-eq\s+
syn match shTestOp +\s-ne\s+
syn match shTestOp +\s-lt\s+
syn match shTestOp +\s-le\s+
syn match shTestOp +\s-gt\s+
syn match shTestOp +\s-ge\s+
syn match shTestOp +\s-z\s+
syn match shTestOp +\s-n\s+
syn match shTestOp +\s-f\s+
syn match shTestOp +\s-d\s+
syn match shTestOp +\s-e\s+
syn match shTestOp +\s-r\s+
syn match shTestOp +\s-w\s+
syn match shTestOp +\s-x\s+
syn match shTestOp +\s-s\s+
syn match shTestOp +\s-L\s+
syn match shTestOp +\s-h\s+
syn match shTestOp +\s-p\s+
syn match shTestOp +\s-S\s+
syn match shTestOp +\s-t\s+
syn match shTestOp +\s-O\s+
syn match shTestOp +\s-G\s+
syn match shTestOp +\s-nt\s+
syn match shTestOp +\s-ot\s+
syn match shTestOp +\s-ef\s+

" Shebang
syn match shShebang +^#!.*$+

" Keywords
syn keyword shConditional if then else elif fi
syn keyword shRepeat for while until do done in select
syn keyword shStatement case esac function time coproc
syn keyword shException trap

" Builtins
syn keyword shBuiltin echo printf read test eval exec exit export
syn keyword shBuiltin unset set shift wait kill cd pwd pushd popd dirs
syn keyword shBuiltin alias unalias type which command builtin source return
syn keyword shBuiltin break continue declare local readonly typeset let
syn keyword shBuiltin getopts hash ulimit umask bg fg jobs disown suspend
syn keyword shBuiltin logout history fc shopt enable mapfile readarray
syn keyword shBuiltin complete compgen compopt

" Common external commands
syn keyword shCommand grep sed awk find xargs sort uniq cut tr wc head tail
syn keyword shCommand cat tee diff patch tar gzip gunzip zip unzip curl wget
syn keyword shCommand ssh scp rsync git make gcc python perl ruby node docker
syn keyword shCommand kubectl systemctl journalctl chmod chown chgrp mkdir
syn keyword shCommand rmdir rm cp mv ln ls stat file touch date cal df du free
syn keyword shCommand top ps killall pkill pgrep nice nohup screen tmux man
syn keyword shCommand info apropos whereis locate

" Special variables
syn match shSpecialVar +\$HOME\>+
syn match shSpecialVar +\$PATH\>+
syn match shSpecialVar +\$USER\>+
syn match shSpecialVar +\$SHELL\>+
syn match shSpecialVar +\$PWD\>+
syn match shSpecialVar +\$OLDPWD\>+
syn match shSpecialVar +\$HOSTNAME\>+
syn match shSpecialVar +\$RANDOM\>+
syn match shSpecialVar +\$LINENO\>+
syn match shSpecialVar +\$SECONDS\>+
syn match shSpecialVar +\$BASH_VERSION\>+
syn match shSpecialVar +\$IFS\>+
syn match shSpecialVar +\$PS1\>+
syn match shSpecialVar +\$PS2\>+
syn match shSpecialVar +\$TERM\>+
syn match shSpecialVar +\$EDITOR\>+
syn match shSpecialVar +\$LANG\>+
syn match shSpecialVar +\$LC_ALL\>+
syn match shSpecialVar +\$TMPDIR\>+
syn match shSpecialVar +\$COLUMNS\>+
syn match shSpecialVar +\$LINES\>+
syn match shSpecialVar +\$FUNCNAME\>+
syn match shSpecialVar +\$BASH_SOURCE\>+
syn match shSpecialVar +\$BASH_LINENO\>+
syn match shSpecialVar +\$PIPESTATUS\>+
syn match shSpecialVar +\$BASH_REMATCH\>+

" Function definition
syn match shFunctionName +\w\+\s*()+ contains=shFunctionParen
syn match shFunctionParen +()\s*$+ contained

" Highlighting
hi def link shComment Comment
hi def link shTodo Todo
hi def link shSingleQuote String
hi def link shDoubleQuote String
hi def link shHeredoc String
hi def link shHeredocDelim Special
hi def link shEscape Special
hi def link shSpecialChar Special
hi def link shCommandSub Special
hi def link shCmdSubRegion Special
hi def link shBacktick Special
hi def link shVariable Identifier
hi def link shDeref Identifier
hi def link shSpecialVar Constant
hi def link shNumber Number
hi def link shOperator Operator
hi def link shTestOp Operator
hi def link shConditional Conditional
hi def link shRepeat Repeat
hi def link shStatement Statement
hi def link shException Exception
hi def link shBuiltin Function
hi def link shCommand Function
hi def link shShebang PreProc
hi def link shArithRegion Special
hi def link shFunctionName Function
hi def link shFunctionParen Function

let b:current_syntax = "sh"
