" This must be first, because it changes other options as side effect
set nocompatible

" -----------------------------------------------------------------------------
" Vim plugin
" -----------------------------------------------------------------------------

call plug#begin()
  " Aesthetics - Main
  Plug 'sainnhe/everforest'
  " Plug 'windwp/windline.nvim'
  Plug 'vim-airline/vim-airline'
  Plug 'romgrk/barbar.nvim'
  " File Search
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'kyazdani42/nvim-web-devicons' " for tree file icons
  Plug 'junegunn/fzf.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'nvim-lua/plenary.nvim'
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
  Plug 'airblade/vim-gitgutter'
  Plug 'preservim/tagbar'
  Plug 'voldikss/vim-floaterm'
  Plug 'APZelos/blamer.nvim'
  Plug 'sindrets/diffview.nvim'
  " syntax
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'neovim/nvim-lspconfig'
  Plug 'kabouzeid/nvim-lspinstall'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'hrsh7th/nvim-compe'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'
  Plug 'rafamadriz/friendly-snippets'
  Plug 'ray-x/lsp_signature.nvim'
  Plug 'ray-x/navigator.lua'

  Plug 'mattn/emmet-vim'
  Plug 'vim-test/vim-test'

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
" use these mappings as default search and sometimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
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
" fzf
" -----------------------------------------------------------------------------
nnoremap <silent> <leader><Space> :Files<CR>
nnoremap <silent> <leader>ag :Ag<CR>
nnoremap <silent> <leader>rg :Rg<CR>

" -----------------------------------------------------------------------------
" Telescope
" -----------------------------------------------------------------------------
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fs <cmd>Telescope live_grep<cr>
nnoremap <leader>fg <cmd>Telescope git_status<cr>
nnoremap <leader>fl <cmd>Telescope lsp_references<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" -----------------------------------------------------------------------------
" vim-floaterm
" -----------------------------------------------------------------------------
nnoremap <leader>tg <cmd>FloatermNew lazygit<cr>

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
" nvim-compe
" -----------------------------------------------------------------------------
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
inoremap <silent><expr> <C-y>     compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" -----------------------------------------------------------------------------
" vim-gitgutter
" -----------------------------------------------------------------------------
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap gph <Plug>(GitGutterPreviewHunk)

" lsp provider to find the cursor word definition and reference
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

