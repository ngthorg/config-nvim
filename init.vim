" This must be first, because it changes other options as side effect
set nocompatible

" -----------------------------------------------------------------------------
" Vim plugin
" -----------------------------------------------------------------------------

call plug#begin()
  " Useful
  Plug 'nvim-lua/plenary.nvim'
  Plug 'kyazdani42/nvim-web-devicons' " for tree file icons
  " Aesthetics - Main
  Plug 'sainnhe/everforest'
  Plug 'windwp/windline.nvim'
  Plug 'romgrk/barbar.nvim'
  " Fuzzy Finder
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'nvim-telescope/telescope.nvim'
  " Utility
  Plug 'easymotion/vim-easymotion'
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/incsearch-easymotion.vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'windwp/nvim-autopairs'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'tpope/vim-fugitive'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'preservim/tagbar'
  Plug 'voldikss/vim-floaterm'
  Plug 'APZelos/blamer.nvim'
  Plug 'sindrets/diffview.nvim'
  " syntax
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
  Plug 'ray-x/lsp_signature.nvim'
  Plug 'ray-x/navigator.lua'

  " Nvim completion
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-nvim-lua'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'f3fora/cmp-spell'
  Plug 'lukas-reineke/cmp-rg'
  Plug 'onsails/lspkind-nvim'

  " For vsnip users
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'
  Plug 'rafamadriz/friendly-snippets'

  " Lint, Format
  Plug 'jose-elias-alvarez/null-ls.nvim'

  Plug 'mattn/emmet-vim'
  Plug 'vim-test/vim-test'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'rhysd/git-messenger.vim'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'mfussenegger/nvim-dap'
  Plug 'norcalli/nvim-colorizer.lua'

  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " debug
  " Plug 'puremourning/vimspector'
call plug#end()

" -----------------------------------------------------------------------------
"
" -----------------------------------------------------------------------------
syntax on
filetype plugin indent on

" -----------------------------------------------------------------------------
" spaces and tabs
" -----------------------------------------------------------------------------
set ignorecase smartcase hlsearch incsearch
set autoread autoindent smarttab nowrap cursorline
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab number relativenumber
set showtabline=2 regexpengine=0 " colorcolumn=80

" -----------------------------------------------------------------------------
" Main Coloring Configurations
" -----------------------------------------------------------------------------
set t_Co=256
set termguicolors
colorscheme everforest
set encoding=UTF-8
" set guifont=DroidSansMono\ Nerd\ Font:h11

" =============================================================================
" Mappings
" =============================================================================

" -----------------------------------------------------------------------------
" nvim-tree
" -----------------------------------------------------------------------------
nmap <C-n> :NvimTreeToggle<CR>
nmap <leader>r :NvimTreeRefresh<CR>
nmap <leader>n :NvimTreeFindFile<CR>

" -----------------------------------------------------------------------------
" barbar
" -----------------------------------------------------------------------------
" Move to previous/next
nnoremap <silent> <A-,> :BufferPrevious<CR>
nnoremap <silent> <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent> <A-<> :BufferMovePrevious<CR>
nnoremap <silent> <A->> :BufferMoveNext<CR>
" Close buffer
nnoremap <silent> <A-c> :BufferClose<CR>
" Magic buffer-picking mode
nnoremap <silent> <A-p> :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

" -----------------------------------------------------------------------------
" vim-easymotion
" -----------------------------------------------------------------------------
" s{char}{char} to move to {char}{char}
nmap f <Plug>(easymotion-overwin-f2)
" You can use other keymappings like <C-l> instead of <CR> if you want to
nmap z/  <Plug>(incsearch-easymotion-/)
nmap z?  <Plug>(incsearch-easymotion-?)
nmap zg/ <Plug>(incsearch-easymotion-stay)
" :help g:incsearch#auto_nohlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" -----------------------------------------------------------------------------
" tagbar
" -----------------------------------------------------------------------------
nmap <F8> :TagbarToggle<CR>

" -----------------------------------------------------------------------------
" Telescope
" -----------------------------------------------------------------------------
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fs <cmd>Telescope live_grep<CR>
nnoremap <leader>fg <cmd>Telescope git_status<CR>
nnoremap <leader>f* <cmd>Telescope grep_string<CR>
nnoremap <leader>fl <cmd>Telescope lsp_references<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>

" -----------------------------------------------------------------------------
" vim-floaterm
" -----------------------------------------------------------------------------
nnoremap <leader>tg <cmd>FloatermNew lazygit<CR>

" -----------------------------------------------------------------------------
" vim-vsnip
" -----------------------------------------------------------------------------
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'


" -----------------------------------------------------------------------------
" git
" -----------------------------------------------------------------------------
nmap <Leader>gm <Plug>(git-messenger)

" -----------------------------------------------------------------------------
" floaterm
" -----------------------------------------------------------------------------

let g:floaterm_keymap_new = '<Leader>tn'
let g:floaterm_keymap_prev = '<Leader>tp'
let g:floaterm_keymap_next = '<Leader>tP'
let g:floaterm_keymap_hide = '<Leader>th'
let g:floaterm_keymap_kill = '<Leader>tk'
let g:floaterm_keymap_toggle = '<Leader>tt'

" -----------------------------------------------------------------------------
" config python host
" -----------------------------------------------------------------------------
let g:python_host_prog  = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
