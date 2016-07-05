filetype plugin indent on
syntax on
set nu
colorscheme pablo

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set shell=zsh
let mapleader=","

map <C-b> :CtrlPBuffer<cr>
map <Leader>t :w<cr> :Pytest file<cr>
map <Leader>p :w<cr> :Pytest project<cr>
map <Leader>m :!mypy --fast-parser %<cr>

set tabstop=4
set softtabstop=4
set shiftwidth=4

set hidden

set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
set backupdir=/tmp
set directory=/tmp

nnoremap ; :

" select text after pasting
noremap gV `[v`]

" and don't lose selection on indent
vnoremap < <gv
vnoremap > >gv

" Allows you to easily replace the current word and all its occurrences.
nnoremap <Leader>rc :%s/\<<C-r><C-w>\>/
vnoremap <Leader>rc y:%s/<C-r>"/

" Allows you to easily change the current word and all occurrences to something
" else. The difference between this and the previous mapping is that the mapping
" below pre-fills the current word for you to change.
nnoremap <Leader>cc :%s/\<<C-r><C-w>\>/<C-r><C-w>
vnoremap <Leader>cc y:%s/<C-r>"/<C-r>"

call plug#begin('~/.vim/plugged')
Plug 'alfredodeza/pytest.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-sensible'
Plug 'fatih/vim-go'
Plug 'elmcast/elm-vim'
Plug 'tpope/vim-surround'
Plug 'weynhamz/vim-plugin-minibufexpl'
call plug#end()

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E402'
