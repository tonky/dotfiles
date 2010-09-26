" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Made from pablo scheme

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "tonky"

highlight Comment	 ctermfg=8						  guifg=#606060 " comments
highlight Constant	 ctermfg=14			   cterm=none guifg=#6184cd				  gui=none " strings
highlight Identifier ctermfg=6						  guifg=#00c0c0 " function, <>, =
highlight Statement  ctermfg=3			   cterm=bold guifg=#cdbb58				  gui=bold " operators, tag names
highlight PreProc	 ctermfg=10						  guifg=#3a8164 " ?
highlight Type		 ctermfg=2						  guifg=#2f8120 " var, this, html attributes
highlight Special	 ctermfg=12						  guifg=#0000ff " ?
highlight Error					ctermbg=9							guibg=#ff0000
highlight Todo		 ctermfg=4	ctermbg=3			  guifg=#000080 guibg=#c0c000 " ?
highlight Directory  ctermfg=2						  guifg=#00c000
highlight StatusLine ctermfg=11 ctermbg=12 cterm=none guifg=#ffff00 guibg=#0000ff gui=none
highlight Normal									  guifg=#fefefe guibg=#000000
highlight Search				ctermbg=3							guibg=#c0c000

highlight Folded guibg=black guifg=#00e0e0 ctermfg=grey ctermbg=darkgrey
:hi Function guifg=#00c0c0 ctermfg=brown
