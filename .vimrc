colorscheme tonky
set background=dark
highlight Cursor guibg=Green guifg=NONE

syntax enable

set fileencodings=ucs-bom,utf-8,cp1251,default,latin1
filetype plugin indent on

autocmd filetype python set expandtab
autocmd filetype html,xml set listchars-=tab:>.

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set nopaste
set pastetoggle=<F2>

let NERDTreeQuitOnOpen=1          " Quit on opening files from the tree

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$' ]

nmap ,n :NERDTreeClose<CR>:NERDTreeToggle<CR>
nmap ,m :NERDTreeClose<CR>:NERDTreeFind<CR>
nmap ,N :NERDTreeClose<CR>

nnoremap ; :

nmap <silent> ,/ :let @/=""<CR>
cmap w!! w !sudo tee % >/dev/null

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set number
set encoding=utf-8
set termencoding=utf-8
set directory=~/.vim/swap,.
set wrap
set ch=1
" set foldenable
" set foldmethod=indent
" set foldmarker={,}
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent
set showmatch
set number
set ignorecase
set smartcase
set smarttab
set hls
set is
set novb
set textwidth=80
set ssop=blank,buffers,sesdir,folds,help,options,tabpages,winsize
set viminfo='50,<1000,s100,%
" set spell spelllang=en_us
set scrolloff=3
set browsedir=buffer
set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P


" Slimv stuff
" let g:slimv_python = '/usr/bin/python'
let g:slimv_lisp = '/usr/bin/mzscheme'
" let g:slimv_client = 'python ~/.vim/plugin/slimv.py -r "xterm -e @p @s -l sbcl -s"'

if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/python
endif

" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
