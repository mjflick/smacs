" Vim syntax file
" Language:    CSS
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case ignore

" Comments
syn region cssComment start="/\*" end="\*/" contains=cssTodo
syn keyword cssTodo contained TODO FIXME XXX NOTE HACK BUG

" Strings
syn region cssString start=+"+ skip=+\\\\\|\\"+ end=+"+
syn region cssString start=+'+ skip=+\\\\\|\\'+ end=+'+

" Numbers and units
syn match cssNumber "\<\d\+\(\.\d\+\)\?\(%\|em\|rem\|px\|pt\|cm\|mm\|in\|vw\|vh\|vmin\|vmax\|ch\|ex\|fr\|deg\|rad\|grad\|turn\|s\|ms\|Hz\|kHz\|dpi\|dpcm\|dppx\)\?\>"
syn match cssNumber "#[0-9a-fA-F]\{3,8}\>"

" At-rules
syn match cssAtRule "@media\>"
syn match cssAtRule "@import\>"
syn match cssAtRule "@font-face\>"
syn match cssAtRule "@keyframes\>"
syn match cssAtRule "@charset\>"
syn match cssAtRule "@namespace\>"
syn match cssAtRule "@supports\>"
syn match cssAtRule "@page\>"
syn match cssAtRule "@layer\>"
syn match cssAtRule "@container\>"
syn match cssAtRule "@property\>"
syn match cssAtRule "@scope\>"
syn match cssAtRule "@starting-style\>"
syn match cssAtRule "@counter-style\>"

" Properties - layout
syn keyword cssProperty contained display position top right bottom left float clear
syn keyword cssProperty contained visibility opacity overflow
syn keyword cssProperty contained width height

" Properties - z-index
syn match cssProperty contained "\<z-index\>"

" Properties - sizing
syn match cssProperty contained "\<min-width\>"
syn match cssProperty contained "\<max-width\>"
syn match cssProperty contained "\<min-height\>"
syn match cssProperty contained "\<max-height\>"

" Properties - margin
syn keyword cssProperty contained margin
syn match cssProperty contained "\<margin-top\>"
syn match cssProperty contained "\<margin-right\>"
syn match cssProperty contained "\<margin-bottom\>"
syn match cssProperty contained "\<margin-left\>"

" Properties - padding
syn keyword cssProperty contained padding
syn match cssProperty contained "\<padding-top\>"
syn match cssProperty contained "\<padding-right\>"
syn match cssProperty contained "\<padding-bottom\>"
syn match cssProperty contained "\<padding-left\>"

" Properties - border
syn keyword cssProperty contained border outline
syn match cssProperty contained "\<border-width\>"
syn match cssProperty contained "\<border-style\>"
syn match cssProperty contained "\<border-color\>"
syn match cssProperty contained "\<border-radius\>"
syn match cssProperty contained "\<border-top\>"
syn match cssProperty contained "\<border-right\>"
syn match cssProperty contained "\<border-bottom\>"
syn match cssProperty contained "\<border-left\>"
syn match cssProperty contained "\<box-shadow\>"
syn match cssProperty contained "\<box-sizing\>"

" Properties - background
syn keyword cssProperty contained background color
syn match cssProperty contained "\<background-color\>"
syn match cssProperty contained "\<background-image\>"
syn match cssProperty contained "\<background-position\>"
syn match cssProperty contained "\<background-repeat\>"
syn match cssProperty contained "\<background-size\>"
syn match cssProperty contained "\<background-attachment\>"

" Properties - font and text
syn keyword cssProperty contained font
syn match cssProperty contained "\<font-family\>"
syn match cssProperty contained "\<font-size\>"
syn match cssProperty contained "\<font-weight\>"
syn match cssProperty contained "\<font-style\>"
syn match cssProperty contained "\<font-variant\>"
syn match cssProperty contained "\<line-height\>"
syn match cssProperty contained "\<letter-spacing\>"
syn match cssProperty contained "\<word-spacing\>"
syn match cssProperty contained "\<text-align\>"
syn match cssProperty contained "\<text-decoration\>"
syn match cssProperty contained "\<text-transform\>"
syn match cssProperty contained "\<text-indent\>"
syn match cssProperty contained "\<text-shadow\>"
syn match cssProperty contained "\<text-overflow\>"
syn match cssProperty contained "\<white-space\>"
syn match cssProperty contained "\<word-break\>"
syn match cssProperty contained "\<word-wrap\>"
syn match cssProperty contained "\<overflow-wrap\>"
syn match cssProperty contained "\<vertical-align\>"

" Properties - list
syn match cssProperty contained "\<list-style\>"
syn match cssProperty contained "\<list-style-type\>"
syn match cssProperty contained "\<list-style-position\>"
syn match cssProperty contained "\<list-style-image\>"

" Properties - misc
syn keyword cssProperty contained cursor content resize
syn match cssProperty contained "\<pointer-events\>"
syn match cssProperty contained "\<user-select\>"
syn match cssProperty contained "\<counter-reset\>"
syn match cssProperty contained "\<counter-increment\>"
syn keyword cssProperty contained quotes
syn match cssProperty contained "\<clip-path\>"
syn keyword cssProperty contained filter isolation
syn match cssProperty contained "\<backdrop-filter\>"
syn match cssProperty contained "\<mix-blend-mode\>"
syn match cssProperty contained "\<object-fit\>"
syn match cssProperty contained "\<object-position\>"
syn match cssProperty contained "\<aspect-ratio\>"
syn match cssProperty contained "\<container-type\>"
syn match cssProperty contained "\<container-name\>"

" Properties - transition and animation
syn keyword cssProperty contained transition animation transform
syn match cssProperty contained "\<transition-property\>"
syn match cssProperty contained "\<transition-duration\>"
syn match cssProperty contained "\<transition-timing-function\>"
syn match cssProperty contained "\<transition-delay\>"
syn match cssProperty contained "\<animation-name\>"
syn match cssProperty contained "\<animation-duration\>"
syn match cssProperty contained "\<animation-timing-function\>"
syn match cssProperty contained "\<animation-delay\>"
syn match cssProperty contained "\<animation-iteration-count\>"
syn match cssProperty contained "\<animation-direction\>"
syn match cssProperty contained "\<animation-fill-mode\>"
syn match cssProperty contained "\<animation-play-state\>"
syn match cssProperty contained "\<transform-origin\>"
syn keyword cssProperty contained perspective
syn match cssProperty contained "\<perspective-origin\>"
syn match cssProperty contained "\<backface-visibility\>"

" Properties - flexbox
syn keyword cssProperty contained flex order gap
syn match cssProperty contained "\<flex-direction\>"
syn match cssProperty contained "\<flex-wrap\>"
syn match cssProperty contained "\<flex-flow\>"
syn match cssProperty contained "\<flex-grow\>"
syn match cssProperty contained "\<flex-shrink\>"
syn match cssProperty contained "\<flex-basis\>"
syn match cssProperty contained "\<justify-content\>"
syn match cssProperty contained "\<align-items\>"
syn match cssProperty contained "\<align-self\>"
syn match cssProperty contained "\<align-content\>"
syn match cssProperty contained "\<row-gap\>"
syn match cssProperty contained "\<column-gap\>"

" Properties - grid
syn keyword cssProperty contained grid columns
syn match cssProperty contained "\<grid-template\>"
syn match cssProperty contained "\<grid-template-columns\>"
syn match cssProperty contained "\<grid-template-rows\>"
syn match cssProperty contained "\<grid-template-areas\>"
syn match cssProperty contained "\<grid-column\>"
syn match cssProperty contained "\<grid-row\>"
syn match cssProperty contained "\<grid-area\>"
syn match cssProperty contained "\<grid-auto-columns\>"
syn match cssProperty contained "\<grid-auto-rows\>"
syn match cssProperty contained "\<grid-auto-flow\>"
syn match cssProperty contained "\<place-items\>"
syn match cssProperty contained "\<place-content\>"
syn match cssProperty contained "\<place-self\>"
syn match cssProperty contained "\<column-count\>"
syn match cssProperty contained "\<column-width\>"
syn match cssProperty contained "\<column-rule\>"
syn match cssProperty contained "\<column-span\>"
syn match cssProperty contained "\<column-fill\>"

" Properties - scroll
syn match cssProperty contained "\<scroll-behavior\>"
syn match cssProperty contained "\<scroll-snap-type\>"
syn match cssProperty contained "\<scroll-snap-align\>"
syn match cssProperty contained "\<scroll-margin\>"
syn match cssProperty contained "\<scroll-padding\>"

" Properties - performance and new
syn match cssProperty contained "\<will-change\>"
syn keyword cssProperty contained contain
syn match cssProperty contained "\<accent-color\>"
syn keyword cssProperty contained appearance
syn match cssProperty contained "\<caret-color\>"
syn match cssProperty contained "\<color-scheme\>"

" Match property names before colon in declaration blocks
syn match cssPropertyMatch "[a-zA-Z-]\+\s*:" contained contains=cssProperty

" Declaration blocks
syn region cssBlock start="{" end="}" transparent contains=cssPropertyMatch,cssProperty,cssValue,cssString,cssNumber,cssComment,cssFunction,cssPseudo,cssImportant

" Values
syn keyword cssValue none auto inherit initial unset revert
syn keyword cssValue block inline flex grid table contents absolute relative
syn keyword cssValue fixed sticky static hidden visible scroll clip
syn keyword cssValue transparent normal bold italic underline overline
syn keyword cssValue capitalize uppercase lowercase center left right justify
syn keyword cssValue top middle bottom baseline nowrap pre pointer default
syn keyword cssValue row column wrap stretch start end ease linear
syn keyword cssValue forwards backwards both alternate reverse infinite
syn keyword cssValue running paused cover contain fill
syn match cssValue "\<inline-block\>"
syn match cssValue "\<inline-flex\>"
syn match cssValue "\<inline-grid\>"
syn match cssValue "\<flow-root\>"
syn match cssValue "\<currentColor\>"
syn match cssValue "\<pre-wrap\>"
syn match cssValue "\<pre-line\>"
syn match cssValue "\<break-word\>"
syn match cssValue "\<break-all\>"
syn match cssValue "\<keep-all\>"
syn match cssValue "\<not-allowed\>"
syn match cssValue "\<zoom-in\>"
syn match cssValue "\<zoom-out\>"
syn match cssValue "\<row-reverse\>"
syn match cssValue "\<column-reverse\>"
syn match cssValue "\<space-between\>"
syn match cssValue "\<space-around\>"
syn match cssValue "\<space-evenly\>"
syn match cssValue "\<flex-start\>"
syn match cssValue "\<flex-end\>"
syn match cssValue "\<ease-in\>"
syn match cssValue "\<ease-out\>"
syn match cssValue "\<ease-in-out\>"
syn match cssValue "\<step-start\>"
syn match cssValue "\<step-end\>"
syn match cssValue "\<alternate-reverse\>"
syn match cssValue "\<border-box\>"
syn match cssValue "\<content-box\>"
syn match cssValue "\<padding-box\>"
syn match cssValue "\<scale-down\>"
syn keyword cssValue local scroll fixed grabbing crosshair text move wait help progress grab

" Important
syn match cssImportant "!important"

" Pseudo-classes
syn match cssPseudo ":\(hover\|active\|focus\|visited\|link\|root\|target\|empty\|checked\|disabled\|enabled\|required\|optional\|valid\|invalid\|default\|indeterminate\|defined\)\>"
syn match cssPseudo ":\(focus-visible\|focus-within\|first-child\|last-child\|only-child\|first-of-type\|last-of-type\|only-of-type\|read-only\|read-write\|placeholder-shown\|any-link\|local-link\|in-range\|out-of-range\)\>"
syn match cssPseudo ":\(nth-child\|nth-last-child\|nth-of-type\|not\|is\|where\|has\|lang\|dir\)("
syn match cssPseudo "::\(before\|after\|first-line\|first-letter\|placeholder\|selection\|marker\|backdrop\|file-selector-button\|cue\|part\|slotted\)"

" Functions
syn match cssFunction "\<\(calc\|min\|max\|clamp\|var\|env\|url\|attr\|counter\|counters\)("
syn match cssFunction "\<\(rgb\|rgba\|hsl\|hsla\|hwb\|lab\|lch\|oklch\|oklab\|color\|color-mix\|light-dark\)("
syn match cssFunction "\<\(linear-gradient\|radial-gradient\|conic-gradient\|repeating-linear-gradient\|repeating-radial-gradient\|repeating-conic-gradient\)("
syn match cssFunction "\<\(image-set\|cross-fade\|element\|paint\)("
syn match cssFunction "\<\(fit-content\|minmax\|repeat\|auto-fill\|auto-fit\)("
syn match cssFunction "\<\(translate\|rotate\|scale\|skew\|matrix\|perspective\)("
syn match cssFunction "\<\(translateX\|translateY\|translateZ\|translate3d\)("
syn match cssFunction "\<\(rotateX\|rotateY\|rotateZ\|rotate3d\)("
syn match cssFunction "\<\(scaleX\|scaleY\|scaleZ\|scale3d\)("
syn match cssFunction "\<\(cubic-bezier\|steps\)("
syn match cssFunction "\<\(blur\|brightness\|contrast\|drop-shadow\|grayscale\|hue-rotate\|invert\|saturate\|sepia\|opacity\)("

" Selectors - element, class, id
syn match cssSelector "[.#][a-zA-Z_-][a-zA-Z0-9_-]*"
syn match cssSelector "\*"

" Highlighting links
hi def link cssComment Comment
hi def link cssTodo Todo
hi def link cssString String
hi def link cssNumber Number
hi def link cssAtRule PreProc
hi def link cssProperty Keyword
hi def link cssPropertyMatch Keyword
hi def link cssValue Constant
hi def link cssImportant Exception
hi def link cssPseudo Identifier
hi def link cssFunction Function
hi def link cssSelector Statement
hi def link cssBlock Normal

let b:current_syntax = "css"
