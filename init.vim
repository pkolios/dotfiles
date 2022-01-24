set nobackup
set noswapfile

call plug#begin('~/.config/nvim/plugged')
Plug 'mhinz/vim-startify'
Plug 'rhysd/committia.vim'
Plug 'romainl/vim-qf'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'jremmen/vim-ripgrep'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'akinsho/nvim-bufferline.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

Plug 'raimon49/requirements.txt.vim'
Plug 'stsewd/isort.nvim', {'do': ':UpdateRemotePlugins'}

call plug#end()

" theme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
syntax enable

colorscheme notheme
" fix ugly background
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE
highlight EndOfBuffer guibg=NONE ctermbg=NONE

filetype plugin indent on     " required!

" Show leader command
set showcmd

" Map leader key to ,
let mapleader = ","

" Normal backspace
set bs=2

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" Use case-smart searching
set ignorecase
set smartcase

" Make file/command completion useful
set wildmode=list:longest,full

" highlight tabs and trailing spaces
set list
set listchars=tab:▸\ ,trail:▫

" utf-8 default encoding
set enc=utf-8
set encoding=utf-8

" Maintain more context around the cursor
set scrolloff=5

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing

" yank and paste with the system clipboard
set clipboard=unnamedplus

" automatically open the location/quickfix window
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

" Startify
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1

" Settings for ctrlp
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others  --exclude-standard %s']
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" vim-ripgrep
let g:rg_highlight = 1

au FileType python source ~/.dotfiles/python.vim

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

lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
require("bufferline").setup{}
EOF
