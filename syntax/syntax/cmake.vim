" Vim syntax file
" Language:    CMake
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case ignore

" Comments
syn keyword cmakeTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region cmakeComment start="#" end="$" contains=cmakeTodo
syn region cmakeComment start="#\[\[" end="\]\]" contains=cmakeTodo

" String literals
syn region cmakeString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=cmakeEscape,cmakeVariable,cmakeGenExpr
syn region cmakeString start=+\[\[+ end=+\]\]+

" Escape sequences
syn match cmakeEscape contained +\\[\\nrt"();#]+

" Variables
syn match cmakeVariable /\${[^}]\+}/ contains=cmakeBuiltinVar
syn match cmakeVariable /\$ENV{[^}]\+}/
syn match cmakeVariable /\$CACHE{[^}]\+}/

" Generator expressions
syn region cmakeGenExpr start=+\$<+ end=+>+ contains=cmakeGenExpr,cmakeVariable,cmakeString contained

" Built-in variables
syn keyword cmakeBuiltinVar contained CMAKE_SOURCE_DIR CMAKE_BINARY_DIR
syn keyword cmakeBuiltinVar contained CMAKE_CURRENT_SOURCE_DIR CMAKE_CURRENT_BINARY_DIR
syn keyword cmakeBuiltinVar contained CMAKE_INSTALL_PREFIX CMAKE_BUILD_TYPE
syn keyword cmakeBuiltinVar contained CMAKE_C_COMPILER CMAKE_CXX_COMPILER
syn keyword cmakeBuiltinVar contained CMAKE_C_FLAGS CMAKE_CXX_FLAGS
syn keyword cmakeBuiltinVar contained CMAKE_MODULE_PATH CMAKE_PREFIX_PATH
syn keyword cmakeBuiltinVar contained CMAKE_SYSTEM_NAME CMAKE_SYSTEM_PROCESSOR
syn keyword cmakeBuiltinVar contained PROJECT_NAME PROJECT_VERSION
syn keyword cmakeBuiltinVar contained PROJECT_SOURCE_DIR PROJECT_BINARY_DIR
syn keyword cmakeBuiltinVar contained BUILD_SHARED_LIBS CMAKE_POSITION_INDEPENDENT_CODE
syn keyword cmakeBuiltinVar contained CMAKE_EXPORT_COMPILE_COMMANDS
syn keyword cmakeBuiltinVar contained CMAKE_CXX_STANDARD CMAKE_C_STANDARD
syn keyword cmakeBuiltinVar contained CMAKE_VERBOSE_MAKEFILE
syn keyword cmakeBuiltinVar contained CMAKE_LIBRARY_OUTPUT_DIRECTORY
syn keyword cmakeBuiltinVar contained CMAKE_RUNTIME_OUTPUT_DIRECTORY
syn keyword cmakeBuiltinVar contained CMAKE_ARCHIVE_OUTPUT_DIRECTORY

" Commands
syn keyword cmakeCommand cmake_minimum_required project add_executable
syn keyword cmakeCommand add_library add_subdirectory target_link_libraries
syn keyword cmakeCommand target_include_directories target_compile_definitions
syn keyword cmakeCommand target_compile_options target_compile_features
syn keyword cmakeCommand target_sources find_package find_library find_path
syn keyword cmakeCommand find_program find_file include include_directories
syn keyword cmakeCommand link_directories link_libraries set unset option
syn keyword cmakeCommand message list string math file configure_file
syn keyword cmakeCommand execute_process add_custom_command add_custom_target
syn keyword cmakeCommand add_definitions add_dependencies install export
syn keyword cmakeCommand enable_testing add_test set_target_properties
syn keyword cmakeCommand get_target_property set_property get_property
syn keyword cmakeCommand get_filename_component cmake_policy
syn keyword cmakeCommand cmake_host_system_information

" Conditional and control flow
syn keyword cmakeConditional if elseif else endif
syn keyword cmakeConditional AND OR NOT DEFINED COMMAND POLICY TARGET
syn keyword cmakeConditional EXISTS IS_DIRECTORY IS_SYMLINK IS_ABSOLUTE
syn keyword cmakeConditional MATCHES LESS GREATER EQUAL STRLESS STRGREATER
syn keyword cmakeConditional STREQUAL VERSION_LESS VERSION_GREATER VERSION_EQUAL
syn keyword cmakeConditional IN_LIST

" Repeat
syn keyword cmakeRepeat foreach endforeach while endwhile break continue

" Function/macro definition
syn keyword cmakeStatement function endfunction macro endmacro return

" Message types
syn keyword cmakeConstant FATAL_ERROR SEND_ERROR WARNING AUTHOR_WARNING
syn keyword cmakeConstant STATUS VERBOSE DEBUG TRACE DEPRECATION

" Target properties
syn keyword cmakeConstant PUBLIC PRIVATE INTERFACE IMPORTED ALIAS STATIC
syn keyword cmakeConstant SHARED MODULE OBJECT EXCLUDE_FROM_ALL REQUIRED
syn keyword cmakeConstant COMPONENTS OPTIONAL_COMPONENTS CONFIG QUIET
syn keyword cmakeConstant VERSION SOVERSION LANGUAGES

" Boolean constants
syn keyword cmakeConstant TRUE FALSE ON OFF YES NO

" Numbers
syn match cmakeNumber /\<\d\+\>/
syn match cmakeNumber /\<\d\+\.\d\+\>/
syn match cmakeNumber /\<\d\+\.\d\+\.\d\+\>/

" Operators
syn match cmakeOperator /(/
syn match cmakeOperator /)/

hi def link cmakeComment Comment
hi def link cmakeTodo Todo
hi def link cmakeString String
hi def link cmakeEscape Special
hi def link cmakeVariable Identifier
hi def link cmakeGenExpr Special
hi def link cmakeBuiltinVar Constant
hi def link cmakeCommand Function
hi def link cmakeConditional Conditional
hi def link cmakeRepeat Repeat
hi def link cmakeStatement Statement
hi def link cmakeConstant Constant
hi def link cmakeNumber Number
hi def link cmakeOperator Operator

let b:current_syntax = "cmake"
