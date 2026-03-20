# smacs

A lightweight Emacs-like text editor written in [Strada](https://github.com/strada-lang/strada-lang).

## Building

Requires a working Strada compiler.

```bash
make            # Build smacs
make install    # Install to /usr/local (or PREFIX=/path make install)
```

## Usage

```bash
smacs                           # Open with scratch buffer
smacs file.txt                  # Open a file
smacs file1.txt file2.txt       # Open multiple files
smacs --syntax lang.vim file.c  # Load a vim syntax file
```

## Configuration

smacs reads configuration from `/etc/smacsrc` and `~/.smacsrc`. The format
is `key = value`, one per line. Lines starting with `#` are comments.

### Options

| Key | Values | Default | Description |
|-----|--------|---------|-------------|
| `line-numbers` | `on`/`off` | `off` | Show line numbers |
| `tab-width` | 1-16 | 4 | Spaces per tab stop |
| `indent-tabs-mode` | `on`/`off` | `off` | Use real tabs instead of spaces |
| `fill-column` | 1-1000 | 70 | Column width for M-q fill-paragraph |
| `undo-max` | integer | 100 | Maximum undo entries per buffer |
| `which-function-mode` | `on`/`off` | `on` | Show current function name in status bar |
| `syntax` | language name | auto | Override syntax highlighting language |
| `vim-syntax` | path | - | Load a single vim syntax file |
| `syntax-dir` | path | - | Load all vim syntax files from a directory |
| `syntax-ext` | ext:lang | - | Map a file extension to a language |
| `completion-mode` | `on`/`off` | `off` | Enable code completion (M-TAB) |
| `complete-dir` | path | `~/.smacs/complete` | Directory of `.complete` autocomplete files |

### Example ~/.smacsrc

```
line-numbers = on
tab-width = 4
fill-column = 80
indent-tabs-mode = off

# Load vim syntax files from a directory
syntax-dir = ~/vim-syntax

# Manual extension-to-language mappings
syntax-ext = rs:rust
syntax-ext = ts:typescript

# Autocomplete definitions
complete-dir = ~/.smacs/complete
```

## Code Completion

smacs provides prefix-based code completion triggered by `M-TAB` (Alt+Tab).
Completion mode is off by default -- enable it with `M-x completion-mode`.

Candidates come from three sources (in priority order):

1. **Language definition files** -- `.complete` files in the `complete-dir`
2. **Syntax keywords** -- from built-in highlighting and loaded vim syntax files
3. **Buffer words** -- identifiers from all open buffers

### Completion Definition Files

Place files named `{language}.complete` in `~/.smacs/complete/` (or the
directory set by `complete-dir`). Format:

```
# Comments start with #
keyword: if else while for return func fn my our
type: int str num scalar array hash void
builtin: say print push pop shift unshift length substr
core: core::open core::close core::read core::write
method: new isa can
```

Each line has a category followed by a colon and space-separated words.
Categories are for organization -- all words are merged into the candidate
list. Multiple lines with the same category are combined.

The language name is derived from the filename: `strada.complete` provides
completions when editing `.strada` files, `c.complete` for `.c` files, etc.

### Using Completion

1. Type the beginning of a word
2. Press `M-TAB` (or `ESC` then `TAB`)
3. If one match: inserted immediately
4. If multiple: a popup menu appears
   - `C-n` / `DOWN` -- next candidate
   - `C-p` / `UP` -- previous candidate
   - `RET` / `TAB` -- accept selection
   - `ESC` / `C-g` -- dismiss
   - Continue typing to narrow the list

Completion is context-aware: it handles `$variable` names, `core::` namespaced
functions, and `->` method calls.

Use `M-x reload-completions` to reload definition files after editing them.

## Syntax Highlighting

smacs has built-in syntax highlighting for C, Strada, Perl, Python,
JavaScript, HTML, CSS, Shell, and Markdown.

Additional languages can be added by loading vim syntax files.

### Loading Vim Syntax Files

There are three ways to load vim syntax files:

**1. syntax-dir (recommended)**

Point `syntax-dir` at a directory containing vim syntax files. smacs supports
both flat directories of `.vim` files and the standard vim plugin layout:

```
my-syntax/
  ftdetect/
    rust.vim        # au BufRead,BufNewFile *.rs setfiletype rust
  syntax/
    rust.vim        # syn keyword, syn match, syn region, hi link ...
```

When a `ftdetect/` subdirectory is present, smacs parses the autocmd lines to
learn which file extensions map to which language. This is how smacs knows that
`.rs` files should use the `rust` syntax definition.

When there is no `ftdetect/` subdirectory, smacs loads `.vim` files directly
from the directory and infers the language name from the filename
(e.g., `python.vim` registers as language `python`).

```
# In ~/.smacsrc
syntax-dir = ~/vim-syntax
```

**2. syntax-ext (manual extension mapping)**

If your syntax files don't include `ftdetect/` data, or you want to add extra
extensions for an existing language, use `syntax-ext`:

```
# In ~/.smacsrc
syntax-ext = rs:rust
syntax-ext = jsx:javascript
syntax-ext = tsx:typescript
syntax-ext = ts:typescript
```

Multiple extensions can map to the same language with separate lines.

**3. vim-syntax (single file)**

Load a single vim syntax file by path:

```
# In ~/.smacsrc
vim-syntax = ~/vim-syntax/rust.vim
```

Or from the command line:

```bash
smacs --syntax rust.vim main.rs
```

Or at runtime with `M-x load-vim-syntax`.

### Supported Vim Syntax Constructs

smacs parses a subset of vim syntax files:

- `syn keyword GroupName word1 word2 ...`
- `syn match GroupName /pattern/`
- `syn region GroupName start=/pat/ end=/pat/`
- `hi def link GroupName HighlightGroup`
- `au BufRead,BufNewFile *.ext setfiletype lang` (in ftdetect files)

Tilde (`~`) is expanded to `$HOME` in all paths.

## Key Bindings

### Movement

| Key | Action |
|-----|--------|
| `C-f` / `RIGHT` | Forward char |
| `C-b` / `LEFT` | Backward char |
| `C-n` / `DOWN` | Next line |
| `C-p` / `UP` | Previous line |
| `C-a` / `HOME` | Beginning of line |
| `C-e` / `END` | End of line |
| `M-f` | Forward word |
| `M-b` | Backward word |
| `C-v` / `PGDN` | Page down |
| `M-v` / `PGUP` | Page up |
| `M-<` | Beginning of buffer |
| `M->` | End of buffer |
| `M-g` | Goto line |

### Editing

| Key | Action |
|-----|--------|
| `C-d` / `DEL` | Delete char |
| `Backspace` | Backward delete char |
| `C-k` | Kill line |
| `C-y` | Yank (paste) |
| `C-w` | Kill region |
| `M-w` | Copy region |
| `C-SPC` | Set mark |
| `M-d` | Kill word forward |
| `M-Backspace` | Kill word backward |
| `M-q` | Fill paragraph |
| `C-_` / `C-/` | Undo |
| `TAB` | Indent / insert tab |

### Search & Replace

| Key | Action |
|-----|--------|
| `C-s` | Incremental search forward |
| `C-r` | Incremental search backward |
| `M-%` | Query replace |

In incremental search, `C-s` with an empty query recalls the last search.
`UP`, `DOWN`, `RET`, and `ESC` all exit the search. `C-g` cancels and
restores the original cursor position.

### Files & Buffers

| Key | Action |
|-----|--------|
| `C-x C-s` | Save file |
| `C-x C-f` | Find (open) file |
| `C-x C-w` | Write file (save as) |
| `C-x b` | Switch buffer |
| `C-x k` | Kill buffer |
| `C-x RIGHT` | Next buffer |
| `C-x LEFT` | Previous buffer |
| `C-x C-c` | Quit |

### Windows

| Key | Action |
|-----|--------|
| `C-x 2` | Split window horizontally |
| `C-x 3` | Split window vertically |
| `C-x 1` | Delete other windows |
| `C-x o` | Other window |
| `C-o` | Other window (when split) / Open line |

### Other

| Key | Action |
|-----|--------|
| `M-x` | Execute command |
| `C-g` | Cancel / keyboard quit |
| `C-l` | Redraw screen |
| `C-z` | Suspend (return with `fg`) |
| `C-h b` | Show key bindings |
| `C-h k` | Describe key |
| `C-h l` | License / about |

### M-x Commands

`goto-line`, `replace-regexp`, `replace-string`, `set-tab-width`, `tabify`,
`untabify`, `indent-tabs-mode`, `fill-paragraph`, `set-fill-column`,
`count-words`, `count-lines`, `revert-buffer`, `set-syntax`,
`load-vim-syntax`, `what-cursor-position`, `line-numbers-mode`,
`which-function-mode`, `hex-mode`

### Hex Mode

Toggle with `M-x hex-mode`. Displays file contents as hex and ASCII side by
side. Press `TAB` to switch between hex and ASCII editing areas.

## License

smacs is free software licensed under the
[GNU General Public License v2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html).

Copyright (C) 2026 Michael J. Flickinger <mjflick@gnu.org>
