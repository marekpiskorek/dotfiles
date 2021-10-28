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
" LSP Native
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
" Git stuff
Plug 'f-person/git-blame.nvim'
Plug 'airblade/vim-gitgutter'
" Telescope requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Color scheme
Plug 'sainnhe/sonokai'
" ACK
Plug 'mileszs/ack.vim'
" NERDTree
Plug 'preservim/nerdtree'
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

" folding
set foldmethod=indent
set foldlevelstart=99  " start unfolded, only top-level.
" nnoremap <CR> zr  " map enter to fold
" nnoremap <BS> zm  " map backspace to unfold

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
" Autostart NERDTree
" TODO: do this only in git directories
" au VimEnter * NERDTree
" Ignore paths in NERDTree
let g:NERDTreeIgnore = ['^__pycache__$']

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" auto-format
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

lua <<EOF
-- Initialize lsp-cmp for autocompletion
local cmp = require'cmp'
cmp.setup({
    snippet = {
      expand = function(args)
     end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-e>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
    }
  })
-- Initialize LSP servers
require'lspconfig'.pyright.setup{}
  -- Setup lspconfig.
--require'lspconfig'.pyright.setup {
--capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--  }
EOF

