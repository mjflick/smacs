" Vim syntax file
" Language:    Dockerfile
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case ignore

" Comments
syn keyword dockerTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region dockerComment start="#" end="$" contains=dockerTodo

" Instructions (keywords)
syn keyword dockerKeyword FROM AS RUN CMD LABEL MAINTAINER EXPOSE ENV
syn keyword dockerKeyword ADD COPY ENTRYPOINT VOLUME USER WORKDIR ARG
syn keyword dockerKeyword ONBUILD STOPSIGNAL HEALTHCHECK SHELL NONE

" String literals
syn region dockerString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=dockerEscape,dockerEnvVar
syn region dockerString start=+'+ skip=+\\\\\|\\'+ end=+'+

" Escape sequences
syn match dockerEscape contained +\\[\\nrt"']+
syn match dockerLineCont /\\$/

" Environment variables
syn match dockerEnvVar /\$\w\+/ contained
syn match dockerEnvVar /\${\w\+}/ contained
syn match dockerEnvVar /\${[^}]\+}/ contained

" FROM line with image:tag@digest
syn match dockerImage /\S\+:\S\+/ contained
syn match dockerImage /\S\+@sha256:\S\+/ contained

" Flags
syn match dockerFlag /--\w\+\(-\w\+\)*/
syn match dockerFlag /--\w\+=\S*/

" JSON array form (for CMD, ENTRYPOINT, etc.)
syn region dockerJSON start="\[" end="\]" contains=dockerString

" Numbers
syn match dockerNumber /\<\d\+\>/
syn match dockerNumber /\<\d\+\.\d\+\>/

" Exposed ports
syn match dockerPort /\<\d\+\(\/\(tcp\|udp\)\)\?\>/

" Operators
syn match dockerOperator /=/

" HERE documents (Docker BuildKit)
syn region dockerHeredoc start="<<[-~]\?\z(\w\+\)" end="^\z1$" contains=dockerEnvVar

hi def link dockerComment Comment
hi def link dockerTodo Todo
hi def link dockerKeyword Keyword
hi def link dockerString String
hi def link dockerEscape Special
hi def link dockerLineCont Special
hi def link dockerEnvVar Identifier
hi def link dockerImage String
hi def link dockerFlag Special
hi def link dockerJSON Special
hi def link dockerNumber Number
hi def link dockerPort Number
hi def link dockerOperator Operator
hi def link dockerHeredoc String

let b:current_syntax = "dockerfile"
