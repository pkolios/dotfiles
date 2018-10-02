set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
Plugin 'jacoborus/tender.vim'
Plugin 'rakr/vim-two-firewatch'  " use only for lightline
Plugin 'sheerun/vim-polyglot'
Plugin 'itchyny/lightline.vim'
Plugin 'romainl/vim-cool'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'w0rp/ale'
Plugin 'jremmen/vim-ripgrep'

call vundle#end()
filetype plugin indent on     " required!

" Auto reload .vimrc
autocmd! bufwritepost .vimrc source %

" Syntax highlighting
syntax on

" Theme
if (has("termguicolors"))
  set termguicolors
endif
syntax enable
set background=dark
colorscheme tender

" Normal backspace
set bs=2

" Show leader command
set showcmd

" Map leader key to ,
let mapleader = ","

" Keep longer history
set history=1000
set undolevels=1000

" Enable extended % matching
runtime macros/matchit.vim

" Make file/command completion useful
set wildmode=list:longest,full

" Use case-smart searching
set ignorecase
set smartcase

" Set the title of the Terminal to the currently open file
function! SetTerminalTitle()
    let titleString = expand('%:t')
    if len(titleString) > 0
        let &titlestring = expand('%:t')
        " this is the format iTerm2 expects when setting the window title
        let args = "\033];".&titlestring."\007"
        let cmd = 'silent !echo -e "'.args.'"'
        execute cmd
        redraw!
    endif
endfunction

autocmd BufEnter * call SetTerminalTitle()

" Maintain more context around the cursor
set scrolloff=5

" yank and paste with the system clipboard
set clipboard=unnamed

" redraw only when we need to.
set lazyredraw

" speed up tty
set ttyfast
set ttymouse=xterm2
set ttyscroll=3

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Enable limited line numbering
set ruler

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

" current directory is always matching the
" content of the active window
"set autochdir

" Autoresize windows when Vim is resized
autocmd VimResized * :wincmd =

" highlight tabs and trailing spaces
set list
set listchars=tab:▸\ ,trail:▫

set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=236

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" utf-8 default encoding
set enc=utf-8
set encoding=utf-8

" don't bell or blink
set noerrorbells
set vb t_vb=

" tab completion of words in insert mode
function InsertTabWrapper()
      let col = col('.') - 1
      if !col || getline('.')[col - 1] !~ '\k'
          return "\<tab>"
      else
          return "\<c-p>"
      endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" Paste toggle (for indentation when pasting)
set pastetoggle=<leader>p

" Enable lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'twofirewatch'
      \ }
" Hide default vim mode info
set noshowmode

" Settings for ctrlp
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Ale
let g:ale_open_list = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_c_gcc_options='-std=c11 -Wall -I../include -I./include -L./lib/'
let g:ale_c_clang_options='-std=c11 -Wall -I../include -I./include -L./lib/'

let g:ale_fixers = {
\   'python': [
\       'black',
\       'isort',
\   ],
\}

" The ripgrep
if executable('rg')
  " Use rg over grep
  set grepprg=rg\ --no-heading\ --vimgrep\ --smart-case
  " Use rg in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  " rg is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" automatically open the location/quickfix window
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

" Python breakpoint shortcut
map <Leader>b obreakpoint()  # BREAKPOINT<C-c>

" Remap Q W and E to q w e
if has("user_commands")
    command! -bang -nargs=? -complete=file E e<bang> <args>
    command! -bang -nargs=? -complete=file W w<bang> <args>
    command! -bang -nargs=? -complete=file Wq wq<bang> <args>
    command! -bang -nargs=? -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
    command! -bang Wqa wqa<bang>
    command! -bang WQa wqa<bang>
endif
