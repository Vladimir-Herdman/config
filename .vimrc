"  text
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set clipboard="unnamedplus"
set cursorline
set incsearch
set hlsearch
set syntax
set mouse="a"
set ignorecase
set smartcase

"  Window/Screen
set nowrap
set number
set relativenumber
set scrolloff=999
set virtualedit="block"
set cursorline
set signcolumn="yes:1"
set confirm

"  Keymappings
let mapleader = " "

nnoremap <Leader>n :noh<CR>

nnoremap <Leader>c i<C-r>=

nnoremap s :&&<CR>
nnoremap <Leader>sg :%s/\<<C-r><C-w>\>//gcI<Left><Left><Left><Left>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>sv :vsplit<CR>
nnoremap <Leader>sh :split<CR>

nnoremap <Up> :m -2 <CR>
nnoremap <Down> :m +1 <CR>
nnoremap <Left> :tabprevious<CR>
nnoremap <Right> :tabNext<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
