set nu
set nocompatible
set showcmd
set ruler
set expandtab
set tabstop=2
set shiftwidth=2
set noerrorbells
set esckeys
set ignorecase " Make searching case insensitive...
set smartcase  " ... unless the query has capital letters.
set hidden " So you don't need to save buffer before switching

filetype off
syntax on

call plug#begin('~/.vim/plugged')
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx'
Plug 'sbdchd/neoformat'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
Plug 'prettier/prettier'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'chriskempson/base16-vim'
Plug 'notpratheek/vim-luna'
Plug 'reasonml-editor/vim-reason'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
call plug#end()

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='luna'

set laststatus=2 " So that status line shows up
set background=dark

set statusline+=%#warningmsg# " syntastic
set statusline+=%{SyntasticStatuslineFlag()} " syntastic
set statusline+=%* "syntastic

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_debug_file = 'syntastic.log'
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
let g:typescript_indent_disable = 1 " Use prettier for indentations, etc.
highlight LineNr ctermfg=30
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql Prettier

nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>be :enew<CR>
nmap <leader>bl :ls<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprevious<CR>
