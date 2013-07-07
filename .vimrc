" Auto reload .vimrc
autocmd! bufwritepost .vimrc source %

" Theme
colorscheme molokai 
let g:molokai_original = 1
let g:rehash256 = 1

" Normal backspace
set bs=2

" Show leader command
set showcmd

" Allow vim to manage multiple buffers
set hidden

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

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Pathogen plugin loader
execute pathogen#infect()

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Enable limited line numbering
set ruler

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
syntax on
filetype on
filetype plugin on
filetype indent on

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

" current directory is always matching the
" content of the active window
set autochdir

" highlight tabs and trailing spaces
set listchars=tab:>-,trail:~
set list

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

" Paste toggle (for indentation when pasting)
set pastetoggle=<leader>p

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

