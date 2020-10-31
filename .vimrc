" execute pathogen#infect()
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
set number

" Enabling search highlighting
set hlsearch

" Enabling spell check
set spelllang=en
set spellfile=$HOME/Dropbox/vim/spell/en.utf-8.add

" Change tab width
set shiftwidth=0
set tabstop=4

" Set Shift-Enter to create new line

nmap <S-Enter> O<Esc>j
nmap <CR o<Esc>k

""" GIT GUTTER 

" Set update time

set updatetime=100

" Go to next or prev hunk key bindings

nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)

" Stage and Undo Hotkeys

nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

" Dont know what these do yet... commenting out
" omap ih <Plug>(GitGutterTextObjectInnerPending)
" omap ah <Plug>(GitGutterTextObjectOuterPending)
" xmap ih <Plug>(GitGutterTextObjectInnerVisual)
" xmap ih <Plug>(GitGutterTextObjectOuterVisual)

" Highlights

" Make Sign Column transparent
highlight! link SignColumn LineNr

highlight GitGutterAdd guifg=#0B310B ctermfg=2
highlight GitGutterChange guifg=#990200 ctermfg=3
highlight GitGutterDelete guifg=#5F0000 ctermfg=1

" Sign symbols
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '--'
let g:gitgutter_sign_removed_above_and_below = '^_'
let g:git_gutter_sign_modified_removed = '>-'
