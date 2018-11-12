let mapleader=" "
if has('nvim')
    let s:editor_root=expand("~/.config/nvim")
else
    let s:editor_root=expand("~/.vim")
endif
"--------------------------------------------------------------------------
"Vundle Env 
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Lokaltog/vim-powerline'

Plugin 'Valloric/YouCompleteMe'

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'hdima/python-syntax'
Plugin 'darfink/vim-plist'
" automatically adjusts 'shiftwidth' and 'expandtab' 
" heuristically based on the current file
Plugin 'tpope/vim-sleuth'

" UnltSnips
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
"colors-themes
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'DrSpatula/vim-buddy'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'scheakur/vim-scheakur'
Plugin 'atelierbram/vim-colors_atelier-schemes'

call vundle#end()            " required
filetype plugin indent on    " required


"YCM Configuration
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"YCM Color
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_tags_files=1
set completeopt-=preview
let g:ycm_cache_omnifunc=0     
let g:ycm_seed_identifiers_with_syntax=1

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
set background=light
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
