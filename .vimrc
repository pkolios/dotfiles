set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'jacoborus/tender.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'python-mode/python-mode'
Plugin 'Glench/Vim-Jinja2-Syntax'

call vundle#end()
filetype plugin indent on     " required!

" Auto reload .vimrc
autocmd! bufwritepost .vimrc source %

" Syntax highlighting
syntax on

" Theme
" set background=dark
" colorscheme hybrid_reverse
syntax enable
colorscheme tender
" fix seargh highlight
hi Search ctermfg=235 ctermbg=15 cterm=NONE
" Custom Highlighting
augroup myhighlight
    autocmd BufRead,BufNewFile * syn match Braces /[(){}]/
    autocmd BufRead,BufNewFile * syn match javaScriptOpSymbols "=\{1,3}\|!==\|!=\|<\|>\|>=\|<=\|++\|+=\|--\|-="
    autocmd BufRead,BufNewFile * syn match javaScriptEndColons "[;,]"
    autocmd BufRead,BufNewFile * syn match javaScriptLogicSymbols "\(&&\)\|\(||\)"
augroup END
hi Braces ctermfg=153 ctermbg=NONE cterm=NONE
hi pythonDottedName ctermfg=185 ctermbg=NONE cterm=NONE
hi pythonFunction ctermfg=185 ctermbg=NONE cterm=NONE

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
set titleold="Terminal"
set titlestring=%F

" Maintain more context around the cursor
set scrolloff=5
set cursorline          " highlight current line

" yank and paste with the system clipboard
set clipboard=unnamed

" redraw only when we need to.
set lazyredraw

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" bind leader+g to grep word under cursor
map <Leader>g :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

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
      \ 'colorscheme': 'tender'
      \ }
" Hide default vim mode info
set noshowmode

" Settings for ctrlp
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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
augroup myvimrc
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END

" Python breakpoint shortcut
map <Leader>b oimport ipdb; ipdb.set_trace()  # BREAKPOINT<C-c>

" Python syntax settings
let python_highlight_all = 1

" Python mode settings
let g:pymode = 1
let g:pymode_python = 'python3'
let g:pymode_rope = 0
let g:pymode_doc = 0
let g:pymode_virtualenv = 0
let g:pymode_lint = 0
let g:pymode_options_max_line_length = 79
let g:pymode_breakpoint = 0
let g:pymode_indent = 1
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_print_as_function = 0
let g:pymode_syntax_highlight_self = g:pymode_syntax_all
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_syntax_string_formatting = g:pymode_syntax_all
let g:pymode_syntax_string_format = g:pymode_syntax_all
let g:pymode_syntax_string_templates = g:pymode_syntax_all
let g:pymode_syntax_doctests = g:pymode_syntax_all
let g:pymode_syntax_builtin_objs = g:pymode_syntax_all
let g:pymode_syntax_builtin_types = g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all
let g:pymode_syntax_docstrings = g:pymode_syntax_all
let g:pymode_folding = 0

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
