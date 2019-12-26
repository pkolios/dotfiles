set nobackup
set noswapfile

call plug#begin('~/.config/nvim/plugged')
Plug 'jacoborus/tender.vim'
Plug 'rakr/vim-two-firewatch'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'
Plug 'Raimondi/delimitMate'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neomake/neomake'
Plug 'jremmen/vim-ripgrep'
Plug 'romainl/vim-qf'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'fgrsnau/ncm2-otherbuf'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'ncm2/ncm2-match-highlight'
Plug 'roxma/nvim-yarp'
Plug 'sbdchd/neoformat'
Plug 'ntpeters/vim-better-whitespace'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'stsewd/isort.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'raimon49/requirements.txt.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/yajs.vim'
Plug 'ncm2/nvim-typescript', {'do': './install.sh'}
call plug#end()

" theme
set termguicolors
syntax enable
colorscheme tender
filetype plugin indent on     " required!

" Show leader command
set showcmd

" Map leader key to ,
let mapleader = ","

" highlight tabs and trailing spaces
set list
set listchars=tab:▸\ ,trail:▫

" Maintain more context around the cursor
set scrolloff=5

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing

" yank and paste with the system clipboard
set clipboard=unnamed

" automatically open the location/quickfix window
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

" Airline
let g:airline_theme = 'tender'
let g:airline_powerline_fonts = 1
let g:airline_extensions_add = ['neomake']

" ncm2 enable for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Isort
let g:vim_isort_python_version = 'python3'

" Neoformat
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
let g:neoformat_run_all_formatters = 1
let g:neoformat_enabled_python = ['black', 'isort']

" Neomake
call neomake#configure#automake('w')
let g:neomake_open_list = 2
let g:neomake_python_enabled_makers = ['python', 'flake8']
let g:neomake_python_python_exe = 'python3'

" Startify
let g:startify_custom_header = [
            \ '         ___',
            \ '        / (_)',
            \ '        \__   _  _    __',
            \ '        /    / |/ |  /',
            \ '        \___/  |  |_/\___/',
            \ '',
            \ ]
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1

" Settings for ctrlp
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Language server
let g:LanguageClient_serverCommands = {
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'typescript': ['yarn', 'run', 'typescript-language-server', '--stdio'],
    \ 'typescript.tsx': ['yarn', 'run', 'typescript-language-server', '--stdio'],
    \ 'python': ['pyls'],
    \ }

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

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

" Python breakpoint shortcut
map <Leader>b obreakpoint()  # BREAKPOINT<C-c>
