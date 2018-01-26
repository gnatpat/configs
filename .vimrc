" Welcome to Vim (http://go/vim).
"
" If you see this file, your homedir was just created on this workstation.
" That means either you are new to Google (in that case, welcome!) or you
" got yourself a faster machine.
" Either way, the main goal of this configuration is to help you be more
" productive; if you have ideas, praise or complaints, direct them to
" vi-users@google.com (http://g/vi-users). We'd especially like to hear from you
" if you can think of ways to make this configuration better for the next
" Noogler.
" If you want to learn more about Vim at Google, see http://go/vimintro.

" Enable modern Vim features not compatible with Vi spec.
set nocompatible

" Set new leader
let mapleader = ","

" Easy editing of .vimrc
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

inoremap jk <esc>
inoremap <esc> <nop>

syntax on
filetype off
set expandtab
set tabstop=2
set shiftwidth=2


"ignore arrow keys
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>


" set relative line numbers
set rnu

" set reloading of a file when changed
set autoread

" turns scroll off 5 lines above and below top of file
set scrolloff=5

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

" Draws a line on the 80th column
set colorcolumn=80

map <leader>y "*y
map <leader>p "*p

nnoremap <leader>' ciw''<ESC>P

" Automatically change the working path to the path of the current file
autocmd BufNewFile,BufEnter * silent! lcd %:p:h

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()


set rtp+=~/.vim/Plugin/vundle/
call vundle#rc()

execute pathogen#infect()

Plugin 'gmarik/vundle' 

" Use the 'google' package by default (see http://go/vim/packages).
source /usr/share/vim/google/google.vim

Glug codefmt
Glug codefmt-google
autocmd FileType bzl AutoFormatBuffer buildifier

Glug piper plugin[mappings]=',o'
Glug relatedfiles plugin[mappings]

nnoremap <leader>l :PiperSelectActiveFiles<CR>

Glug corpweb plugin[mappings]
noremap <leader>cs :CorpWebCs<Space>

" Plugin configuration.
" See http://google3/devtools/editors/vim/examples/ for example configurations
" and http://go/vim/plugins for more information about vim plugins at Google.

" Plugin loading is commented out below - uncomment the plugins you'd like to
" load.

" Load google's formatting plugins (http://go/vim/plugins/codefmt-google).
" The default mapping is \= (or <leader>= if g:mapleader has a custom value),
" with
" - \== formatting the current line or selected lines in visual mode
"   (:FormatLines).
" - \=b formatting the full buffer (:FormatCode).
"
" To bind :FormatLines to the same key in insert and normal mode, add:
"   noremap <C-K> :FormatLines<CR>
"   inoremap <C-K> <C-O>:FormatLines<CR>
Glug codefmt plugin[mappings] gofmt_executable="goimports"
Glug codefmt-google

" Enable autoformatting on save for the languages at Google that enforce
" formatting, and for which all checked-in code is already conforming (thus,
" autoformatting will never change unrelated lines in a file).
"augroup autoformat_settings
"  " For BUILD files and Go all of Google's files must be formatted.
"  autocmd FileType bzl AutoFormatBuffer buildifier
"  autocmd FileType go AutoFormatBuffer gofmt
"augroup END

" Load YCM (http://go/ycm) for semantic auto-completion and quick syntax
" error checking. Pulls in a google3-enabled version of YCM itself and
" a google3-specific default configuration.
" Glug youcompleteme-google

" Load the automated blaze dependency integreation for Go.
" Note: for Go, blazedeps uses the Go team's glaze tool, which is fully
" supported by the Go team; for other languages. Note that the plugin is
" currently unsupported for other languages.
"Glug blazedeps auto_filetypes=`['go']`

" Load piper integration (http://wiki/Main/VimPerforce).
"Glug piper plugin[mappings]

" Load the Critique integration. Use :h critique for more details.
Glug critique plugin[mappings]

" Load blaze integration (http://go/blazevim).
Glug blaze plugin[mappings]='<leader>b'
nnoremap <leader>br :Blaze run<cr>


" Load the syntastic plugin (http://go/vim/plugins/syntastic-google).
" Note: this requires installing the upstream syntastic plugin from
" https://github.com/scrooloose/syntastic.
Glug syntastic-google checkers=`{'python': 'gpylint'}`
" Configure to taste. See ":help syntastic".
let g:syntastic_mode_map = {'mode': 'passive'}
let g:syntastic_python_checker_args = '-d E0611'

nnoremap <leader>. :SyntasticCheck gpylint<cr>

" Load the ultisnips plugin (http://go/ultisnips).
" Note: this requires installing the upstream ultisnips plugin from
" https://github.com/SirVer/ultisnips.
"Glug ultisnips-google

" All of your plugins must be added before the following line.

" Enable file type based indent configuration and syntax highlighting.
" Note that when code is pasted via the terminal, vim by default does not detect
" that the code is pasted (as opposed to when using vim's paste mappings), which
" leads to incorrect indentation when indent mode is on.
" To work around this, use ":set paste" / ":set nopaste" to toggle paste mode.
" You can also use a plugin to:
" - enter insert mode with paste (https://github.com/tpope/vim-unimpaired)
" - auto-detect pasting (https://github.com/ConradIrwin/vim-bracketed-paste)

Plugin 'Lokaltog/powerline'
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

filetype plugin indent on
syntax on
