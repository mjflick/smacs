# smacs(1) - lightweight Emacs-like text editor

## SYNOPSIS

**smacs** [*file* ...]
**smacs** [**--syntax** *file.vim*] [*file* ...]

## DESCRIPTION

**smacs** is a lightweight terminal text editor with Emacs-style keybindings,
written in Strada. It supports multiple buffers, incremental search, regex
replace, syntax highlighting, undo, and a minibuffer command interface with
tab-completion.

## OPTIONS

*file*
:   One or more files to open. The first file replaces the default scratch
    buffer; additional files open in new buffers.

**--syntax** *file.vim*
:   Load a vim syntax highlighting file before opening files.

## KEY BINDINGS

### Movement

**C-f**, **Right**
:   Move forward one character.

**C-b**, **Left**
:   Move backward one character.

**C-n**, **Down**
:   Move to next line.

**C-p**, **Up**
:   Move to previous line.

**C-a**, **Home**
:   Move to beginning of line.

**C-e**, **End**
:   Move to end of line.

**C-v**, **PgDn**
:   Page down.

**M-v**, **PgUp**
:   Page up.

**M-f**
:   Move forward one word.

**M-b**
:   Move backward one word.

**M-<**
:   Move to beginning of buffer.

**M->**
:   Move to end of buffer.

**M-g**
:   Go to line number (prompts for input).

### Editing

**C-d**, **Del**
:   Delete character forward.

**Backspace**
:   Delete character backward.

**M-Backspace**
:   Delete word backward.

**M-d**
:   Delete word forward.

**C-k**
:   Kill (cut) to end of line. Killed text is saved to the kill ring.

**C-y**
:   Yank (paste) from kill ring.

**C-w**
:   Kill (cut) region between mark and cursor.

**M-w**
:   Copy region between mark and cursor.

**C-_**
:   Undo the last editing operation. Up to 100 undo states are saved per
    buffer (configurable via *undo-max*).

**C-o**
:   Open a new line below the cursor.

**C-Space**
:   Set the mark at the current cursor position.

### Search and Replace

**C-s**
:   Incremental search forward. Type the search string; matches highlight
    as you type. Press **C-s** again to find the next match. Press **RET**
    to stop at the current match, or **C-g** to cancel.

**C-r**
:   Reverse incremental search.

**M-%**
:   Query replace. Prompts for search and replacement strings, then
    interactively asks for confirmation at each match.

### Files and Buffers

**C-x C-f**
:   Find file. Prompts for a file path with tab-completion for files and
    directories. If the file is already open, switches to its buffer.

**C-x C-s**
:   Save the current buffer to its file. If the buffer has no file,
    prompts for a path.

**C-x b**
:   Switch buffer. Prompts for a buffer name with tab-completion. If the
    name does not match an existing buffer, a new buffer is created.

**C-x k**
:   Kill (close) the current buffer.

**C-x o**
:   Switch to the next buffer.

**C-x C-b**
:   List all open buffers in the message bar.

**C-x 2**
:   Create a new scratch buffer.

**C-x h**
:   Select all (mark whole buffer).

**C-x C-c**
:   Quit smacs. Prompts for confirmation if there are unsaved changes.

### Other

**M-x**
:   Execute a named command. Supports tab-completion. Press **TAB** with
    an empty input to see all available commands.

**C-g**
:   Cancel the current operation.

**ESC ESC**
:   Cancel (same as C-g).

**C-l**
:   Redraw the screen.

## META KEY

The Meta (Alt) key can be pressed in two ways:

1. Hold Alt and press the key simultaneously (e.g., **Alt+x**).
2. Press **Escape**, release it, then press the key. smacs waits
   indefinitely after Escape for the follow-up key.

## COMMANDS

Commands are invoked via **M-x** followed by the command name:

**replace-regexp**
:   Regex search and replace from cursor to end of buffer.

**query-replace**, **replace-string**
:   Interactive search and replace with confirmation at each match.

**refresh-buffer**, **revert-buffer**
:   Reload the current file from disk.

**goto-line**
:   Jump to a specific line number.

**find-file**
:   Open a file (same as C-x C-f).

**switch-buffer**
:   Switch to a buffer (same as C-x b).

**list-buffers**
:   List all open buffers.

**kill-buffer**
:   Kill the current buffer (same as C-x k).

**line-numbers-mode**
:   Toggle line number display in the left gutter.

**which-function-mode**
:   Toggle display of the enclosing function name in the status bar.
    Enabled by default. Supports C, Strada, Perl, Python, JavaScript,
    and Shell function definitions.

**indent-tabs-mode**
:   Toggle between inserting real tab characters and spaces when pressing
    Tab. Default is spaces.

**set-tab-width**
:   Set the number of spaces per tab stop (1-16). Default is 4. Affects
    Tab key insertion (in spaces mode), *tabify*, and *untabify*.

**tabify**
:   Convert leading spaces to tab characters in the entire buffer, using
    the current tab width.

**untabify**
:   Convert all tab characters to spaces in the entire buffer, using the
    current tab width.

**set-syntax**
:   Manually set the syntax highlighting language.

**load-vim-syntax**
:   Load a vim syntax file for additional language support.

**what-cursor-position**
:   Display the character code and position at the cursor.

**text-mode**, **strada-mode**, **c-mode**, **perl-mode**, **python-mode**, **javascript-mode**, **html-mode**, **css-mode**, **shell-mode**, **makefile-mode**, **markdown-mode**
:   Switch the current buffer's major mode, which controls syntax
    highlighting.

## MAJOR MODES

Major modes are set automatically based on file extension:

| Extension             | Mode       |
|-----------------------|------------|
| .c, .h                | C          |
| .pl, .pm, .t          | Perl       |
| .strada, .st          | Strada     |
| .py                   | Python     |
| .js                   | JavaScript |
| .html, .htm           | HTML       |
| .css                  | CSS        |
| .sh, .bash            | Shell      |
| Makefile, GNUmakefile | Makefile   |
| .md, .markdown        | Markdown   |

The current mode is shown in the status bar in parentheses.

## FILES

**/etc/smacsrc**
:   System-wide configuration file. Read first.

**~/.smacsrc**
:   User configuration file. Read second; overrides system settings.

### Configuration Format

One *key* **=** *value* per line. Lines starting with **#** are comments.

    # Enable line numbers
    line-numbers = on

    # Default syntax
    syntax = strada

    # Max undo entries per buffer (default: 100)
    undo-max = 200

    # Tab settings (default: 4 spaces)
    tab-width = 4
    indent-tabs-mode = off

    # Function name in status bar (default: on)
    which-function-mode = on

    # Auto-load vim syntax
    vim-syntax = /path/to/lang.vim

## STATUS BAR

The status bar at the bottom shows:

    -- filename  funcname()        (Mode) L42/500 C10

- **\*\*** indicates unsaved changes; **--** indicates a clean buffer.
- **funcname()** shows the enclosing function (when which-function-mode is on).
- **(Mode)** shows the current major mode.
- **L42/500** shows the current line and total line count.
- **C10** shows the current column.

## AUTHOR

Written in Strada.

## SEE ALSO

**emacs**(1), **vi**(1), **nano**(1), **strada**(1)
