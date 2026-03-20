smacs(1) -- lightweight Emacs-like text editor

# SYNOPSIS

`smacs` [*file* ...]
`smacs` [`--syntax` *file.vim*] [*file* ...]

# DESCRIPTION

**smacs** is a lightweight Emacs-like text editor written in Strada. It
provides familiar Emacs key bindings, multiple buffers, split windows,
incremental search, syntax highlighting, and a hex editing mode.

# OPTIONS

*file*
: Open one or more files. If no files are given, smacs starts with a
  scratch buffer.

`--syntax` *file.vim*
: Load a vim syntax file for additional syntax highlighting.

# CONFIGURATION

smacs reads settings from `/etc/smacsrc` and `~/.smacsrc` on startup.
The format is `key = value`, one per line. Lines beginning with `#` are
comments. Tilde (`~`) is expanded to `$HOME` in paths.

## General Options

`line-numbers` = `on` | `off`
: Show line numbers in the gutter. Default: `off`.

`tab-width` = *N*
: Number of spaces per tab stop (1-16). Default: `4`.

`indent-tabs-mode` = `on` | `off`
: Use real tab characters instead of spaces. Default: `off`.

`fill-column` = *N*
: Column width for `M-q` fill-paragraph (1-1000). Default: `70`.

`undo-max` = *N*
: Maximum undo entries per buffer. Default: `100`.

`which-function-mode` = `on` | `off`
: Show current function name in the status bar. Default: `on`.

## Syntax Highlighting Options

`syntax` = *language*
: Override the auto-detected syntax highlighting language.

`vim-syntax` = *path*
: Load a single vim syntax file.

`syntax-dir` = *path*
: Load all vim syntax files from a directory. Supports both flat
  directories of `.vim` files and the standard vim plugin layout with
  `ftdetect/` and `syntax/` subdirectories. When `ftdetect/` files are
  present, file extension mappings are automatically registered from
  autocmd lines (e.g., `au BufRead,BufNewFile *.rs setfiletype rust`).

`syntax-ext` = *ext*:*language*
: Map a file extension to a syntax language name. Multiple entries can
  map different extensions to the same language. Example:

    syntax-ext = rs:rust
    syntax-ext = ts:typescript
    syntax-ext = tsx:typescript

# KEY BINDINGS

## Movement

`C-f`, `RIGHT`
: Forward character.

`C-b`, `LEFT`
: Backward character.

`C-n`, `DOWN`
: Next line.

`C-p`, `UP`
: Previous line.

`C-a`, `HOME`
: Beginning of line.

`C-e`, `END`
: End of line.

`M-f`
: Forward word.

`M-b`
: Backward word.

`C-v`, `PGDN`
: Page down.

`M-v`, `PGUP`
: Page up.

`M-<`
: Beginning of buffer.

`M->`
: End of buffer.

`M-g`
: Goto line number.

## Editing

`C-d`, `DEL`
: Delete character.

`Backspace`
: Backward delete character.

`C-k`
: Kill to end of line.

`C-y`
: Yank (paste) from kill ring.

`C-w`
: Kill region.

`M-w`
: Copy region.

`C-SPC`
: Set mark.

`M-d`
: Kill word forward.

`M-Backspace`
: Kill word backward.

`M-q`
: Fill paragraph to fill-column width.

`C-_`, `C-/`
: Undo.

## Search & Replace

`C-s`
: Incremental search forward. Press `C-s` again with an empty query to
  recall the last search. `UP`, `DOWN`, `RET`, and `ESC` exit the
  search. `C-g` cancels and restores the cursor position.

`C-r`
: Incremental search backward.

`M-%`
: Query replace.

## Files & Buffers

`C-x C-s`
: Save file.

`C-x C-f`
: Find (open) file. Starts in the directory of the current file.

`C-x C-w`
: Write file (save as).

`C-x b`
: Switch buffer. Suggests the last viewed buffer as default.

`C-x k`
: Kill buffer.

`C-x RIGHT`
: Next buffer.

`C-x LEFT`
: Previous buffer.

`C-x C-c`
: Quit.

## Windows

`C-x 2`
: Split window horizontally.

`C-x 3`
: Split window vertically.

`C-x 1`
: Delete other windows.

`C-x o`
: Switch to other window.

## Other

`M-x`
: Execute a named command.

`C-g`
: Cancel current operation.

`C-l`
: Redraw screen.

`C-z`
: Suspend smacs (resume with `fg`).

`C-h b`
: Show key bindings help.

`C-h k`
: Describe key.

`C-h l`
: Show license and about information.

## M-x Commands

`goto-line`, `replace-regexp`, `replace-string`, `set-tab-width`,
`tabify`, `untabify`, `indent-tabs-mode`, `fill-paragraph`,
`set-fill-column`, `count-words`, `count-lines`, `revert-buffer`,
`set-syntax`, `load-vim-syntax`, `what-cursor-position`,
`line-numbers-mode`, `which-function-mode`, `hex-mode`

# HEX MODE

Toggle hex mode with `M-x hex-mode`. Displays file contents as
hexadecimal and ASCII side by side. Press `TAB` to switch between hex
and ASCII editing areas. `M-g` prompts for a hex offset to jump to.
`C-x C-s` saves the raw binary data back to the file.

# FILES

`/etc/smacsrc`
: System-wide configuration file.

`~/.smacsrc`
: Per-user configuration file.

# AUTHOR

Michael J. Flickinger <mjflick@gnu.org>

# LICENSE

GNU General Public License v2 or later.
See `COPYING` for the full license text.
