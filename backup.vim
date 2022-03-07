syntax on

set cursorline
set noerrorbells
set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set encoding=UTF-8
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set incsearch
set hlsearch
set shortmess-=S
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set hidden
set autoindent
filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
Plug 'jiangmiao/auto-pairs'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'honza/vim-snippets'
Plug 'tpope/vim-abolish'
Plug 'mhinz/vim-startify'
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'nvim-treesitter/nvim-treesitter' " We recommend updating the parsers on update
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
"should be the last one
Plug 'ryanoasis/vim-devicons' 

call plug#end()

set termguicolors
let g:airline_powerline_fonts = 1
colorscheme gruvbox
let $BAT_THEME = "gruvbox-dark"
set background=dark
let mapleader = " "

let g:NERDTreeWinSize=30
let NERDTreeShowHidden=1

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

nnoremap <CR> o<esc>o<esc>
nnoremap <leader><CR> :source ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
vnoremap <leader>p "_dP
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeFind<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

nnoremap <nowait><silent> <C-c> :noh<CR>


" Syntastic configuration
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

xnoremap <leader>p "_dP

let g:doge_php_settings = {
\  'resolve_fqn': 1
\}

autocmd BufEnter NERD_tree_* | execute 'normal R'

lua << EOF
require'lspconfig'.phpactor.setup{}
EOF

lua << EOF
-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
EOF
