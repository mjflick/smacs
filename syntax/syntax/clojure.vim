" Vim syntax file
" Language:    Clojure
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match clojureComment ";.*$" contains=clojureTodo
syn region clojureComment start="#_" end="\s" contains=clojureTodo
syn keyword clojureTodo contained TODO FIXME XXX NOTE HACK BUG

" Discard macro
syn region clojureDiscard matchgroup=clojureComment start="#_\s*(" end=")" contains=TOP

" Strings
syn region clojureString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=clojureEscape
syn match clojureEscape +\\[\\'"bfnrt0]+ contained
syn match clojureEscape +\\u[0-9a-fA-F]\{4\}+ contained
syn match clojureEscape +\\o[0-7]\{1,3\}+ contained
syn match clojureEscape +\\newline\|\\space\|\\tab\|\\return\|\\backspace\|\\formfeed+ contained

" Regex
syn region clojureRegex start=+#"+ skip=+\\\\\|\\"+ end=+"+

" Characters
syn match clojureChar +\\[^ \t\n\r]\++
syn match clojureChar +\\newline+
syn match clojureChar +\\space+
syn match clojureChar +\\tab+
syn match clojureChar +\\return+
syn match clojureChar +\\backspace+
syn match clojureChar +\\formfeed+
syn match clojureChar +\\u[0-9a-fA-F]\{4\}+
syn match clojureChar +\\o[0-7]\{1,3\}+

" Numbers
syn match clojureNumber +\<[-+]\?\d\+\>+
syn match clojureNumber +\<[-+]\?\d\+\.\d*\([eE][-+]\?\d\+\)\?\>+
syn match clojureNumber +\<[-+]\?\d\+/\d\+\>+
syn match clojureNumber +\<[-+]\?0[xX][0-9a-fA-F]\+\>+
syn match clojureNumber +\<[-+]\?\d\+[rR][0-9a-zA-Z]\+\>+
syn match clojureNumber +\<[-+]\?\d\+N\>+
syn match clojureNumber +\<[-+]\?\d\+\.\d*M\>+

" Keywords (atoms starting with :)
syn match clojureKeywordLit +:\{1,2\}[a-zA-Z!$%&*+\-./:<=>?@^_~][a-zA-Z0-9!$%&*+\-./:<=>?@^_~]*+

" Constants
syn keyword clojureConstant nil true false

" Special forms and definitions
syn keyword clojureKeyword def defn defn- defmacro defmulti defmethod
syn keyword clojureKeyword defprotocol defrecord deftype defstruct defonce
syn keyword clojureKeyword fn let loop recur do quote var
syn keyword clojureKeyword new set! throw monitor-enter monitor-exit
syn keyword clojureKeyword ns import require use in-ns refer refer-clojure
syn keyword clojureKeyword gen-class gen-interface proxy reify
syn keyword clojureKeyword extend-type extend-protocol

" Conditional forms
syn keyword clojureConditional if if-not if-let if-some when when-not when-let
syn keyword clojureConditional when-first when-some cond condp case

" Looping / sequence
syn keyword clojureRepeat for doseq dotimes while loop recur

" Exception handling
syn keyword clojureException try catch finally throw

" Threading macros and special forms
syn match clojureOperator +->+
syn match clojureOperator +->>+
syn match clojureOperator +as->+
syn match clojureOperator +cond->+
syn match clojureOperator +cond->>+
syn match clojureOperator +some->+
syn match clojureOperator +some->>+
syn keyword clojureKeyword doto

" Types
syn keyword clojureType Integer Long Double Float BigDecimal BigInteger Ratio
syn keyword clojureType Boolean Character String Symbol Keyword
syn keyword clojureType List Vector Map Set Seq LazySeq
syn keyword clojureType Atom Ref Agent Var Namespace Class Regex

" Core functions - arithmetic
syn keyword clojureBuiltin + - * / inc dec mod rem quot max min abs
syn keyword clojureBuiltin rand rand-int

" Core functions - comparison
syn match clojureBuiltin +\<not=\>+
syn keyword clojureBuiltin not

" Core functions - logic
syn keyword clojureBuiltin and or

" Core functions - string
syn keyword clojureBuiltin str subs format name keyword symbol gensym

" Core functions - IO
syn keyword clojureBuiltin println prn print pr pr-str prn-str

" Core functions - collections
syn keyword clojureBuiltin cons conj assoc dissoc get assoc-in update
syn keyword clojureBuiltin merge keys vals count empty?
syn keyword clojureBuiltin seq first rest next last nth
syn keyword clojureBuiltin take drop filter remove map mapv mapcat
syn keyword clojureBuiltin reduce into partition group-by
syn keyword clojureBuiltin sort reverse distinct flatten
syn keyword clojureBuiltin interleave interpose concat
syn keyword clojureBuiltin apply comp partial juxt memoize
syn keyword clojureBuiltin identity constantly complement
syn keyword clojureBuiltin range repeat repeatedly iterate cycle
syn keyword clojureBuiltin zip zipmap
syn keyword clojureBuiltin contains? every? some not-every? not-any?
syn keyword clojureBuiltin read-string

" Core functions - hash map specific
syn keyword clojureBuiltin get-in update-in select-keys

" Core functions - sorting
syn keyword clojureBuiltin sort-by compare

" Core functions - sequence operations
syn keyword clojureBuiltin take-while drop-while partition-by
syn keyword clojureBuiltin chunk flat-map

" Core functions - state
syn keyword clojureBuiltin atom deref reset! swap! compare-and-set!
syn keyword clojureBuiltin ref dosync alter commute ensure
syn keyword clojureBuiltin agent send send-off await
syn keyword clojureBuiltin future promise deliver realized?

" Core functions - type/class
syn keyword clojureBuiltin type class instance? satisfies? extends?
syn keyword clojureBuiltin supers bases ancestors descendants isa?
syn keyword clojureBuiltin parents make-hierarchy underive derive

" Metadata and special reader macros
syn match clojureSpecial +\^{[^}]*}+
syn match clojureSpecial +\^:\w\++
syn match clojureSpecial +\^\w\++
syn match clojureSpecial +'[a-zA-Z]+
syn match clojureSpecial +@\w\++
syn match clojureSpecial +#'+

" Namespaced symbols
syn match clojureNamespace +\<[a-zA-Z][a-zA-Z0-9.*+!\-_?]*\/+

" Anonymous function shorthand
syn match clojureSpecial +#(+
syn match clojureSpecial +%[1-9&]\?+

" Highlighting
hi def link clojureComment Comment
hi def link clojureDiscard Comment
hi def link clojureTodo Todo
hi def link clojureString String
hi def link clojureEscape Special
hi def link clojureRegex String
hi def link clojureChar String
hi def link clojureNumber Number
hi def link clojureKeywordLit Constant
hi def link clojureConstant Constant
hi def link clojureKeyword Keyword
hi def link clojureConditional Conditional
hi def link clojureRepeat Repeat
hi def link clojureException Exception
hi def link clojureOperator Operator
hi def link clojureType Type
hi def link clojureBuiltin Function
hi def link clojureSpecial Special
hi def link clojureNamespace Identifier

let b:current_syntax = "clojure"
