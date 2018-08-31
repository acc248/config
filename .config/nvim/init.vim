set nocompatible              " be iMproved, required
filetype off                  " required

" Move between windows
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" 80 char limit
set cc=80

set foldmethod=indent
set foldlevel=100

:let mapleader = ";"

" Move between windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" pathogen
execute pathogen#infect()

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Syntax
Plugin 'kchmck/vim-coffee-script'
Plugin 'chr4/nginx.vim'
Plugin 'shime/vim-livedown'

" Fuzzy Search
" Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'epeli/slimux'
Plugin 'moll/vim-node'
Plugin 'Yggdroot/indentLine'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

syntax enable
filetype plugin indent on
set number
set noshowmode
set hidden
set hlsearch
set ignorecase
set autoindent
set clipboard=unnamedplus
set history=1000
set cursorline
set backspace=indent,eol,start
autocmd VimLeave * call system("xsel -ib", getreg('+'))
" autocmd BufWritePre * %s/\s\+$//e

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

colorscheme lucius
LuciusBlackLowContrast

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline_theme='lucius'
let g:airline_powerline_fonts = 1
" let g:indentLine_char = '·'

" Slimux remap
nnoremap <Leader>ci :SlimuxREPLConfigure<CR>
nnoremap <Leader>s :SlimuxREPLSendLine<CR>
vnoremap <Leader>s :SlimuxREPLSendSelection<CR>

" copy path to clipboard
nmap <Leader>cp :let @+=expand("%")<CR>

" if has("autocmd")
"   au VimEnter * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_IBEAM/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"
"   au InsertEnter * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_BLOCK/TERMINAL_CURSOR_SHAPE_IBEAM/' ~/.config/xfce4/terminal/terminalrc"
"   au InsertLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_IBEAM/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"
"   au VimLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_BLOCK/TERMINAL_CURSOR_SHAPE_IBEAM/' ~/.config/xfce4/terminal/terminalrc"
" endif

" Super Awesome Casey Chance function
function! SimpleNodeShowModule()
  let l:module = expand('<cword>')
  if l:module == '' || l:module == 'var'
    return
  endif

  call feedkeys("/".l:module."/\<CR>", 'x')
  call feedkeys("ggNn", 'x')
  call feedkeys("^f'gf", "x")
endfunction
nnoremap <silent> <C-g> :call SimpleNodeShowModule()<CR>

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nmap <C-p> :FZF<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordExec
nmap     <C-F>N <Plug>CtrlSFCwordExec
