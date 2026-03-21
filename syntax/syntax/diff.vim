" Vim syntax file
" Language:    Diff/Patch
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Diff header lines
syn match diffCommand "^diff\s.*$"
syn match diffIndex "^index\s.*$"

" File headers
syn match diffOldFile "^---\s.*$"
syn match diffNewFile "^+++\s.*$"

" Hunk headers
syn match diffHunk "^@@\s.*@@.*$"

" Added lines
syn match diffAdded "^+.*$"

" Removed lines
syn match diffRemoved "^-.*$"

" Context lines (lines starting with space)
syn match diffContext "^ .*$"

" Binary file notification
syn match diffComment "^Binary files.*$"

" Only in directory
syn match diffComment "^Only in.*$"

" diff statistics (git format)
syn match diffComment "^\d\+ files\? changed.*$"

" No newline at end of file
syn match diffComment "^\\ No newline at end of file$"

" Rename/copy headers (git)
syn match diffCommand "^rename from\s.*$"
syn match diffCommand "^rename to\s.*$"
syn match diffCommand "^copy from\s.*$"
syn match diffCommand "^copy to\s.*$"
syn match diffCommand "^similarity index\s.*$"
syn match diffCommand "^dissimilarity index\s.*$"
syn match diffCommand "^new file mode\s.*$"
syn match diffCommand "^deleted file mode\s.*$"
syn match diffCommand "^old mode\s.*$"
syn match diffCommand "^new mode\s.*$"

" Highlight links
hi def link diffCommand PreProc
hi def link diffIndex PreProc
hi def link diffOldFile Statement
hi def link diffNewFile Statement
hi def link diffHunk Function
hi def link diffAdded Identifier
hi def link diffRemoved Special
hi def link diffContext Comment
hi def link diffComment Comment

let b:current_syntax = "diff"
