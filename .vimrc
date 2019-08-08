execute pathogen#infect()
syntax on
filetype plugin indent on
set number
" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"

" Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = "<C-S-e>"

" Override view python doc key shortcut to Ctrl-Shift-d
let g:pymode_doc_bind = "<C-S-d>"

" Enable python3 syntax
let g:pymode_python = 'python3'

" Run python code with Ctrl-Shift-r
let g:pymode_run_bind = "<C-S-r>"

" Enabling relative numbering
set relativenumber

" Enabling search highlighting
set hlsearch
