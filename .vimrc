" Auto reload .vimrc
autocmd! bufwritepost .vimrc source %

" Normal backspace
set bs=2

" Show leader command
set showcmd

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wombat colorscheme:
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
" molokai colorscheme:
" wget https://github.com/tomasr/molokai/raw/master/colors/molokai.vim
set t_Co=256
color molokai

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Useful settings
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim
" https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Tab word completion
" mkdir -p ~/.vim/supertab
" wget https://github.com/ervandew/supertab/raw/master/plugin/supertab.vim

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable


"tab completion of words in insert mode
function InsertTabWrapper()
      let col = col('.') - 1
      if !col || getline('.')[col - 1] !~ '\k'
          return "\<tab>"
      else
          return "\<c-p>"
      endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
