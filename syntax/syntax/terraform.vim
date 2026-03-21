" Vim syntax file
" Language:    Terraform/HCL
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword tfTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region tfComment start="#" end="$" contains=tfTodo
syn region tfComment start="//" end="$" contains=tfTodo
syn region tfComment start="/\*" end="\*/" contains=tfTodo

" String literals
syn region tfString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=tfEscape,tfInterp
syn region tfHeredoc start="<<-\?\z(\w\+\)" end="^\s*\z1$" contains=tfEscape,tfInterp

" Escape sequences
syn match tfEscape contained +\\[\\nrt"]+
syn match tfEscape contained +\\u[0-9a-fA-F]\{4}+

" String interpolation
syn region tfInterp start=+\${+ end=+}+ contained contains=tfInterp,tfFunction,tfString

" Block types
syn keyword tfKeyword resource data variable output locals module
syn keyword tfKeyword provider terraform

" Block-level keywords
syn keyword tfKeyword required_providers required_version backend
syn keyword tfKeyword provisioner connection lifecycle
syn keyword tfKeyword depends_on count for_each dynamic content
syn keyword tfKeyword source version type default description
syn keyword tfKeyword sensitive nullable validation condition
syn keyword tfKeyword error_message precondition postcondition
syn keyword tfKeyword moved import check removed

" Types
syn keyword tfType string number bool list map set object tuple any

" Boolean and null constants
syn keyword tfConstant true false null

" Numbers
syn match tfNumber /\<\d\+\>/
syn match tfNumber /\<\d\+\.\d\+\>/
syn match tfNumber /\<\d\+[eE][+-]\?\d\+\>/
syn match tfNumber /\<0[xX][0-9a-fA-F]\+\>/

" Functions
syn keyword tfFunction abs ceil floor log max min pow signum
syn keyword tfFunction chomp format formatlist indent join lower upper
syn keyword tfFunction title trim trimprefix trimsuffix trimspace
syn keyword tfFunction replace regex regexall substr startswith endswith
syn keyword tfFunction split compact concat contains distinct element
syn keyword tfFunction flatten index keys length lookup merge one
syn keyword tfFunction range reverse setintersection setproduct setsubtract
syn keyword tfFunction setunion slice sort sum transpose values zipmap
syn keyword tfFunction base64decode base64encode base64gzip csvdecode
syn keyword tfFunction jsondecode jsonencode textdecodebase64 textencodebase64
syn keyword tfFunction urlencode yamldecode yamlencode abspath dirname
syn keyword tfFunction pathexpand basename file fileexists fileset
syn keyword tfFunction filebase64 templatefile formatdate plantimestamp
syn keyword tfFunction timeadd timecmp timestamp tostring tonumber tobool
syn keyword tfFunction tolist toset tomap try can nonsensitive type
syn keyword tfFunction cidrhost cidrnetmask cidrsubnet cidrsubnets
syn keyword tfFunction uuid uuidv5 bcrypt md5 rsadecrypt sha1 sha256
syn keyword tfFunction sha512 base64sha256 base64sha512 filemd5 filesha1
syn keyword tfFunction filesha256 filesha512 filebase64sha256 filebase64sha512

" Function calls
syn match tfFuncCall /\<\w\+\>\ze\s*(/

" Operators
syn match tfOperator /==/
syn match tfOperator /!=/
syn match tfOperator />=/
syn match tfOperator /<=/
syn match tfOperator /&&/
syn match tfOperator /||/
syn match tfOperator /[><!]/
syn match tfOperator /[+\-*/%]/
syn match tfOperator /=>/
syn match tfOperator /\.\.\./

" Braces and brackets
syn match tfBrace /[{}[\]()]/

" Attribute access
syn match tfDot /\./

" For expressions
syn keyword tfRepeat for in if

" References
syn keyword tfIdentifier var local module data each self count

hi def link tfComment Comment
hi def link tfTodo Todo
hi def link tfString String
hi def link tfHeredoc String
hi def link tfEscape Special
hi def link tfInterp Special
hi def link tfKeyword Keyword
hi def link tfType Type
hi def link tfConstant Constant
hi def link tfNumber Number
hi def link tfFunction Function
hi def link tfFuncCall Function
hi def link tfOperator Operator
hi def link tfBrace Operator
hi def link tfRepeat Repeat
hi def link tfIdentifier Identifier

let b:current_syntax = "terraform"
