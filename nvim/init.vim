filetype plugin indent on
syntax on
set nu
set ignorecase
colorscheme pablo

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*     " MacOSX/Linux

set shell=zsh
let mapleader=","

inoremap <S-TAB> <C-X><C-O>

map <C-b> :CtrlPBuffer<cr>
"map <Leader>t :GoTest!<cr>
map <Leader>b :GoBuild!<cr>
map <Leader>r :GoRun!<cr>
map <Leader>m :!mypy --fast-parser %<cr>
map <Leader>j :bn<cr>

autocmd FileType python map <Leader>t :Pytest file<cr>
autocmd FileType go map <Leader>t :GoTest!<cr>


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
noremap <M-j> :bp<cr>
noremap <M-k> :bn<cr>

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
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'buoto/gotests-vim'
" Plug 'elmcast/elm-vim'
Plug 'tpope/vim-surround'
Plug 'weynhamz/vim-plugin-minibufexpl'
"Plug 'jiangmiao/auto-pairs'
Plug 'Raimondi/delimitMate'
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'airblade/vim-gitgutter'
call plug#end()

let delimitMate_expand_cr = 2

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"syntastic
"set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E402'
