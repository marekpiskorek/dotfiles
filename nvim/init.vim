if &compatible
    set nocompatible               " Be iMproved
endif

" Spacebar is the leader key
nnoremap <SPACE> <Nop>
let mapleader=" " 

filetype plugin indent on
" Only set syntax highlighting once!
if !exists("g:syntax_on")
    syntax enable
endif 

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'f-person/git-blame.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'sainnhe/sonokai'
Plug 'mileszs/ack.vim'
Plug 'lervag/vimtex'
Plug 'preservim/nerdtree'
Plug 'ray-x/go.nvim'
call plug#end()

if !&scrolloff
    set scrolloff=3       " Show next 3 lines while scrolling.
endif

" Make splits open in more natural locations
set splitbelow
set splitright

set display+=lastline
set clipboard=unnamedplus
set mouse=
set ruler               " Show the line and column numbers of the cursor.
set autoread
set noshowmode                    " Show current mode.
set encoding=utf-8              " Set default encoding to UTF-8
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set autoindent
set tabstop=4 shiftwidth=4 expandtab
"set gdefault " use g flag by default on searches
set number relativenumber

" Make navigating between splits a little easier. Just use leader h,j,k,l
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Open nvimrc file
nnoremap <Leader>v :vsp $MYVIMRC<CR>

" Source nvimrc file
nnoremap <Leader>sv :source $MYVIMRC<CR>
 
" Configure colorscheme
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai

" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({}))<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" Map finder to something intuitive
nnoremap <leader>ff <cmd>Telescope find_files<cr>

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" Do not open first result immidiately and use shortcut
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" NERDTree keybindings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Open NERDTree on startup
autocmd VimEnter * NERDTree

" Coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use Enter for confirming autocompletion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
