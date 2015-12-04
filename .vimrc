" auto-indent for correct filetype
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

"ignore arrow keys
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"start pathogen
"execute pathogen#infect()
"

" set relative line numbers
set rnu

" set reloading of a file when changed
set autoread

" turns scroll off 5 lines above and below top of file
set scrolloff=5

" keep ruler on all the time
set ruler

" make backspace behave
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" when searching, be smart about cases
set smartcase
" highlight search results
set hlsearch
set incsearch

" don't redraw when executing macros (nice n fast)
set lazyredraw

" regex magic
set magic

" show matching brackets
set showmatch
set mat=2

set noerrorbells
set novisualbell

" treat long lines as break lines
map j gj
map k gk

" 0 now moves to first non blank char
map 0 ^

