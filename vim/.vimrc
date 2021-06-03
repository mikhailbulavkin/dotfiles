call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'

call plug#end()

" Setup 
set number
set textwidth=78
set colorcolumn=78
set tabstop=4
set shiftwidth=4
set omnifunc=syntaxcomplete#Complete
set autoindent
set nobackup
set noundofile
set showcmd

" Folding
set foldmethod=indent
set foldlevel=99
set foldclose=all

" Filetypes tabs
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab

" Emmet self-closing tag
let g:emmet_html5 = 0

" Search highlight
if has('syntax') && has('eval')
  packadd! matchit
endif
if &t_Co > 2 || has("gui_running")
  set hlsearch
endif


" Colors
colorscheme OceanicNext

" YouCompleteMeColors
" highlight YcmErrorLine guibg=#e5c97b
" highlight YcmErrorSection ctermbg=red ctermfg=white
" highlight YcmWarningSection ctermbg=yellow ctermfg=black
" let g:ycm_autoclose_preview_window_after_insertion = 1

" Background
" hi Normal guibg=NONE ctermbg=NONE
" highlight LineNr ctermbg=NONE ctermfg=grey
