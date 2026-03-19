# smacs

A lightweight Emacs-like text editor written in [Strada](https://github.com/strada-lang/strada).

## Features

- Multiple buffers with switching and tab-completion
- **Window splitting** (C-x 2 to split, C-x o to switch, C-x 1 to unsplit)
- Incremental search (C-s) and query replace (M-%)
- Regex replace (M-x replace-regexp)
- Syntax highlighting for C, Perl, Strada, Python, JavaScript, HTML, CSS, Shell, Makefile, and Markdown
- Vim syntax file loading for additional languages
- Major modes (text-mode, strada-mode, c-mode, etc.)
- Line numbers mode
- Undo (C-\_)
- Kill/yank (cut/paste) with kill ring
- Mark and region support
- Bracket matching with highlighting
- File finder with tab-completion (C-x C-f)
- M-x command interface with tab-completion
- Config file support (~/.smacsrc)
- **UTF-8 support** (multi-byte characters, CJK double-width, emoji)
- **Built-in help system** (C-h b for keybindings, C-h k for describe-key)
- Word and line counting (M-x count-words)
- No C code — pure Strada using `core::` runtime functions

## Building

Requires a working Strada compiler (`strada` in PATH).

```sh
make          # Build smacs
make debug    # Build with debug symbols
make clean    # Remove build artifacts
```

Override the compiler with `make STRADA=/path/to/strada`.

## Usage

```sh
smacs                          # Open with scratch buffer
smacs file.txt                 # Open a file
smacs file1.c file2.c          # Open multiple files
smacs --syntax lang.vim file   # Load vim syntax file
```

## Key Bindings

### Movement

| Key        | Action                 |
|------------|------------------------|
| C-f / Right | Forward one character |
| C-b / Left  | Backward one character |
| C-n / Down  | Next line             |
| C-p / Up    | Previous line         |
| C-a / Home  | Beginning of line     |
| C-e / End   | End of line           |
| C-v / PgDn  | Page down             |
| M-v / PgUp  | Page up               |
| M-f         | Forward one word      |
| M-b         | Backward one word     |
| M-<         | Beginning of buffer   |
| M->         | End of buffer         |
| M-g         | Go to line number     |

### Editing

| Key           | Action                    |
|---------------|---------------------------|
| C-d / Del     | Delete character forward  |
| Backspace     | Delete character backward |
| M-Backspace   | Delete word backward      |
| M-d           | Delete word forward       |
| C-k           | Kill to end of line       |
| C-y           | Yank (paste)              |
| C-w           | Kill region               |
| M-w           | Copy region               |
| C-\_          | Undo                      |
| C-o           | Other window (split) / Open line (single) |
| C-Space       | Set mark                  |
| Tab           | Insert spaces (or tab, see indent-tabs-mode) |

### Search and Replace

| Key           | Action                    |
|---------------|---------------------------|
| C-s           | Incremental search        |
| C-r           | Reverse incremental search |
| M-%           | Query replace             |

### Files and Buffers

| Key           | Action                    |
|---------------|---------------------------|
| C-x C-f       | Find file (with completion) |
| C-x C-s       | Save file                 |
| C-x C-w       | Write file (save as)      |
| C-x b         | Switch buffer (with completion) |
| C-x k         | Kill buffer               |
| C-x C-b       | List buffers              |
| C-x C-c       | Quit                      |

### Windows

| Key           | Action                    |
|---------------|---------------------------|
| C-x 2         | Split window horizontally |
| C-x 3         | Split window vertically   |
| C-x o         | Switch to other window    |
| C-x 1         | Delete other windows      |

### Help

| Key           | Action                    |
|---------------|---------------------------|
| C-h b         | Show all key bindings     |
| C-h k         | Describe a key            |

### Other

| Key           | Action                    |
|---------------|---------------------------|
| M-x           | Execute command           |
| C-g / ESC ESC | Cancel                    |
| C-l           | Redraw screen             |
| C-x h         | Select all                |

**Note:** ESC can be pressed slowly before the next key. smacs waits
indefinitely for the follow-up key after ESC, so M-x can be typed as
ESC then x at any speed.

## M-x Commands

| Command              | Action                              |
|----------------------|-------------------------------------|
| replace-regexp       | Regex search and replace            |
| query-replace        | Interactive search and replace      |
| replace-string       | Same as query-replace               |
| refresh-buffer       | Reload file from disk               |
| revert-buffer        | Same as refresh-buffer              |
| goto-line            | Jump to a line number               |
| find-file            | Open a file                         |
| switch-buffer        | Switch to a buffer                  |
| list-buffers         | Show all buffers in message bar     |
| kill-buffer          | Kill the current buffer             |
| count-words          | Count lines, words, and characters  |
| count-lines          | Count lines in buffer               |
| line-numbers-mode    | Toggle line numbers                 |
| which-function-mode  | Toggle function name in status bar  |
| indent-tabs-mode     | Toggle between tabs and spaces      |
| set-tab-width        | Set number of spaces per tab (1-16) |
| tabify               | Convert leading spaces to tabs      |
| untabify             | Convert all tabs to spaces          |
| set-syntax           | Set syntax highlighting language    |
| load-vim-syntax      | Load a vim syntax file              |
| what-cursor-position | Show character info at cursor       |
| text-mode            | Switch to Text mode (no highlight)  |
| strada-mode          | Switch to Strada mode               |
| c-mode               | Switch to C mode                    |
| perl-mode            | Switch to Perl mode                 |
| python-mode          | Switch to Python mode               |
| javascript-mode      | Switch to JavaScript mode           |
| html-mode            | Switch to HTML mode                 |
| css-mode             | Switch to CSS mode                  |
| shell-mode           | Switch to Shell mode                |
| makefile-mode        | Switch to Makefile mode             |
| markdown-mode        | Switch to Markdown mode             |

## Major Modes

Major modes are set automatically when opening a file based on its extension:

| Extension                | Mode       |
|--------------------------|------------|
| .c, .h                   | C          |
| .pl, .pm, .t             | Perl       |
| .strada, .st             | Strada     |
| .py                      | Python     |
| .js                      | JavaScript |
| .html, .htm              | HTML       |
| .css                     | CSS        |
| .sh, .bash               | Shell      |
| Makefile, GNUmakefile    | Makefile   |
| .md, .markdown           | Markdown   |

Modes can also be set manually with `M-x <name>-mode`.

The current mode is displayed in the status bar: `(Strada)`, `(C)`, etc.

## UTF-8 Support

smacs handles multi-byte UTF-8 characters correctly:

- Cursor movement steps by codepoint, not byte
- Insert, delete, and backspace operate on whole characters
- Display width accounts for double-width CJK characters and emoji
- Word movement treats accented and non-ASCII letters as word characters
- Status bar column display shows the display column, not byte offset
- Syntax highlighting iterates by character boundaries

## Configuration

smacs reads configuration from `/etc/smacsrc` (system) and `~/.smacsrc` (user).
The user config overrides system defaults.

Format: one `key = value` per line. Lines starting with `#` are comments.

```
# Enable line numbers by default
line-numbers = on

# Set default syntax highlighting
syntax = strada

# Increase undo history (default 100)
undo-max = 200

# Tab settings
tab-width = 4
indent-tabs-mode = off    # off=spaces (default), on=real tabs

# Show function name in status bar (default: on)
which-function-mode = on

# Auto-load a vim syntax file
vim-syntax = /path/to/lang.vim
```

## License

Same license as the Strada project.
