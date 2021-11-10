set noshowmode
set showcmd
set number
set hlsearch
set incsearch
set ignorecase
set smartcase
set autowrite
set autoread
set autoindent
set smartindent
set scrolloff=4
set hidden
set expandtab
set shiftwidth=4
set shiftround
set softtabstop=4
set tabstop=4
set nojoinspaces
set pastetoggle=<F2>
set nowrap
set splitbelow
set splitright

highlight LineNr ctermfg=8
highlight VertSplit cterm=NONE
set fillchars+=vert:\ 

call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mg979/vim-visual-multi'
Plug 'itchyny/lightline.vim'
Plug 'myusuf3/numbers.vim'

call plug#end()

let mapleader = " "
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap J ^ 
nnoremap K <C-f>
nnoremap H <C-b>
nnoremap L $
nnoremap Y y$
nnoremap <silent><Esc><Esc> :nohls<CR>
nnoremap <Leader>m :NERDTreeToggle<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>p "+p
nnoremap <Leader>y "+y
nnoremap <Leader>v <C-v>

let NERDTreeChDirMode=2
let NERDTreeShowHidden=1
