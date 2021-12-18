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
set mouse=a

highlight LineNr ctermfg=8
highlight VertSplit cterm=NONE
set fillchars+=vert:\ 

call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mg979/vim-visual-multi'
Plug 'itchyny/lightline.vim'
Plug 'myusuf3/numbers.vim'
Plug 'chaoren/vim-wordmotion'
Plug 'kamykn/CCSpellCheck.vim'
Plug 'APZelos/blamer.nvim'
" Plug 'chentau/marks.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'justinmk/vim-sneak'

call plug#end()

lua << EOF
-- put LSP config here
EOF

let g:wordmotion_prefix = '<Leader>'

function! ModeColor()
  let l:prefix="%#Comment#%=%#"
  let l:mode = mode()
  if l:mode == 'n'
    let l:prefix .= 'Character#'
  elseif l:mode == 'i'
    let l:prefix .= 'Function#'
  elseif l:mode == 'v'
    let l:prefix .= 'Boolean#'
  elseif l:mode == 'V'
    let l:prefix .= 'Boolean#'
  elseif l:mode == ''
    let l:prefix .= 'Boolean#'
  elseif l:mode == 't'
    let l:prefix .= 'Constant#'
  elseif l:mode == 'r'
    let l:prefix .= 'Identifier#'
  elseif l:mode == 'c'
    let l:prefix .= 'Conditional#'
  else
    let l:prefix .= 'Comment#'
  endif

  return l:prefix . '%f%#Comment#%='
endfunction

set laststatus=2
" set statusline=%{%ModeColor()%}

let g:lightline = {
            \ 'colorscheme': 'deus',
            \ 'active': {
            \   'right': [['branch'], ['percent'], ['fileformat', 'fileencoding', 'filetype']]
            \   },
            \ 'component_function': {
            \   'branch': 'gitbranch#name'
            \   }
            \ }

function! KeywordNvim()
    if &keywordprg == ':Man'
        let l:man = 'man'
    else
        let l:man = &keywordprg
    endif
    let l:word = expand("<cword>")
    vsplit | enew
    exe 'terminal ' . l:man l:word
endfunction

let mapleader = " "
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <C-j> J
nnoremap <silent><C-k> :call KeywordNvim()<CR>
nnoremap H ^
nnoremap J <C-f>
nnoremap K <C-b>
nnoremap L $
nnoremap Y y$
nnoremap <silent><BS> :b#<CR>
nnoremap <silent><Leader><BS> :bn<CR>
nnoremap <silent><Esc><Esc> :nohls<CR>
nnoremap <silent><Leader>t :NERDTreeToggle<CR>
nnoremap <silent><Leader>f :Files<CR>
nnoremap <silent><Leader>b :BlamerToggle<CR>
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
nnoremap <Leader>y "+y
nnoremap <Leader>Y "+Y
nnoremap <Leader>d "_d
nnoremap <Leader>D "_D
nnoremap <Leader>v <C-v>
nnoremap <Leader>q :.,$norm! @
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

let NERDTreeChDirMode=2
let NERDTreeShowHidden=1
