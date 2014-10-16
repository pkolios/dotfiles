set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'klen/python-mode'

" Go syntax highlighting
set rtp+=$GOROOT/misc/vim

filetype plugin indent on     " required!

" Auto reload .vimrc
autocmd! bufwritepost .vimrc source %

" Theme
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

" Syntax highlighting
syntax on

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

" Set the terminal title
set title

" Maintain more context around the cursor
set scrolloff=3

" yank and paste with the system clipboard
set clipboard=unnamed

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
set autochdir

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

" Settings for ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Python breakpoint shortcut
map <Leader>b oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Python mode settings
let g:pymode_rope = 0
" Documentation
let g:pymode_doc = 0
"Linting
let g:pymode_lint = 1
" Auto check on save
let g:pymode_lint_write = 1
" Enable breakpoints plugin
let g:pymode_breakpoint = 0
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" Don't autofold code
let g:pymode_folding = 0

" Airline settings
set laststatus=2
let g:airline_enable_syntastic=1
let g:airline_theme='dark'

" Put all autocmds in some augroup and use au! to clear the group.
augroup vimrc_autocmds
  au!
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
augroup END
