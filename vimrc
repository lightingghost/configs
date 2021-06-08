let mapleader=" "
let s:editor_root=expand("~/.vim")
"if has('nvim')
"    let s:editor_root=expand("~/.config/nvim")
"else
"    let s:editor_root=expand("~/.vim")
"endif
"-------------------------------------------------------------------------- vim-plug call plug#begin('~/.vim/plugged') 
call plug#begin('~/.vim/plugged')

Plug 'Lokaltog/vim-powerline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}


Plug 'nathanaelkane/vim-indent-guides'

Plug 'majutsushi/tagbar'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'hdima/python-syntax'
Plug 'darfink/vim-plist'
" automatically adjusts 'shiftwidth' and 'expandtab' 
" heuristically based on the current file
Plug 'tpope/vim-sleuth'

" UnltSnips
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
"colors-themes
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'DrSpatula/vim-buddy'
Plug 'NLKNguyen/papercolor-theme'
Plug 'scheakur/vim-scheakur'
Plug 'atelierbram/vim-colors_atelier-schemes'

call plug#end()

"coc
let g:coc_disable_startup_warning = 1

"coc use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" coc Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


"vim-indent-guides configuration
let g:indent_guides_enable_on_vim_startup =0
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
set foldmethod=syntax
set nofoldenable


"UltiSnips
let g:UltiSnipsExpandTrigger=";<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


"tagbar
nnoremap <Leader>tt :TagbarToggle<CR> 

"Nerdtree
nmap <Leader>ft :NERDTreeToggle<CR>

"python-syntax
let python_highligh_builtins=1
let python_highlight_space_errors=0
let python_highlight_all = 1

" papercolor theme
let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }
"1. Vim Behaviour.
" Use filetype-based syntax hilighting, ftplugins, and indentation.
syntax on
" Use numbering. Don't use relative numbering as this is slow (especially in
" .tex files).
set number
" Enables mouse support. Note that on Mac OS X this doesn't work well on the
" default terminal.
set mouse=a
" vim auto complete
set wildmenu
" 2. Key Bindings.
" More convenient movement when lines are wrapped.
nmap j gj
nmap k gk
" copy to / paste from system clipboard
vnoremap <Leader>y "+y
nmap <Leader>p "+p
" split windows below
set splitbelow

" Tab settings
filetype indent on
set autoindent
set smartindent
"set tabstop=4
"set shiftwidth=4
set expandtab
"""" 3. Vim Appearance.
"fonts
set guifont=M+\ 1mn:h13
if has("gui_running")
  set lines=40 columns=90
endif
" no blink cursor
set gcr=a:block-blinkon0
" no scrollbar
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" no menu & bar
set guioptions-=m
set guioptions-=T
" color
set t_Co=256
let g:solarized_termcolors=256
set background=dark
let g:rehash256=1
color PaperColor
" color molokai
" Search settings
set hlsearch " hilight
set incsearch " jump to best fit
 " Turn off seach hilighting with <CR>.
nnoremap <CR> :nohlsearch<CR><CR>

" Make statusline appear even with only single window.
set laststatus=2
set cursorline
" vim: set ft=vim foldmethod=marker ts=4 sw=4 tw=80 et :

"powerline
let g:Powerline_colorscheme='solarized256'
