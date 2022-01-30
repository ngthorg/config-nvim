-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath 'data' .. '~/.local/share/nvim/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
end

-- configure Neovim to automatically run :PackerCompile whenever plugins.lua is updated with an autocommand
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

return require('packer').startup {
  function()
    -- packer plugin manager for Neovim
    use 'wbthomason/packer.nvim'
    -- Useful
    use 'nvim-lua/plenary.nvim'
    use 'kyazdani42/nvim-web-devicons'
    -- Aesthetics - Main
    use 'sainnhe/everforest'
    use 'windwp/windline.nvim'
    use 'romgrk/barbar.nvim'
    -- Fuzzy Finder
    use 'kyazdani42/nvim-tree.lua'
    use 'nvim-telescope/telescope.nvim'
    -- Utility
    use 'easymotion/vim-easymotion'
    use 'haya14busa/incsearch.vim'
    use 'haya14busa/incsearch-easymotion.vim'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'windwp/nvim-autopairs'
    use 'michaeljsmith/vim-indent-object'
    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'
    use 'preservim/tagbar'
    use 'voldikss/vim-floaterm'
    -- use 'akinsho/toggleterm.nvim'
    use 'APZelos/blamer.nvim'
    use 'sindrets/diffview.nvim'
    -- Syntax
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'glepnir/lspsaga.nvim'
    use 'jose-elias-alvarez/nvim-lsp-ts-utils'
    use 'ray-x/lsp_signature.nvim'
    use 'ray-x/navigator.lua'
    -- Nvim completion
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-vsnip' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-cmdline' },
        { 'f3fora/cmp-spell' },
        { 'lukas-reineke/cmp-rg' },
        { 'ray-x/cmp-treesitter' },
        { 'onsails/lspkind-nvim' },
      },
      -- config = require("config.nvim-cmp"),
      -- setup =
      -- cmd =
    }
    -- For vsnip users
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'rafamadriz/friendly-snippets'
    -- Lint, Format
    use 'jose-elias-alvarez/null-ls.nvim'

    use 'mattn/emmet-vim'
    use 'vim-test/vim-test'
    use 'peitalin/vim-jsx-typescript'
    use 'rhysd/git-messenger.vim'
    use 'windwp/nvim-ts-autotag'
    use 'mfussenegger/nvim-dap'
    use 'norcalli/nvim-colorizer.lua'

    use { 'fatih/vim-go', run = ':GoUpdateBinaries' }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    },
  },
}
