-- Automatically install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

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
    use {
      'sainnhe/everforest',
      -- 'sainnhe/gruvbox-material',
      config = function()
        require 'configs.colorscheme'
      end,
    }
    use {
      'windwp/windline.nvim',
      config = function()
        require 'configs.windline'
      end,
    }
    use 'romgrk/barbar.nvim'
    -- Fuzzy Finder
    use {
      'kyazdani42/nvim-tree.lua',
      config = function()
        require 'configs.nvim-tree'
      end,
    }
    use 'nvim-telescope/telescope.nvim'
    -- Utility
    use 'easymotion/vim-easymotion'
    use 'haya14busa/incsearch.vim'
    use 'haya14busa/incsearch-easymotion.vim'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use {
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup {}
        require 'configs.autopairs'
      end,
    }
    use 'michaeljsmith/vim-indent-object'
    use 'tpope/vim-fugitive'
    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require 'configs.gitsigns'
      end,
    }
    use 'preservim/tagbar'
    use 'voldikss/vim-floaterm'
    -- use 'akinsho/toggleterm.nvim'
    use 'APZelos/blamer.nvim'
    use {
      'sindrets/diffview.nvim',
      config = function()
        require 'configs.diffview'
      end,
    }
    -- Syntax
    use {
      'nvim-treesitter/nvim-treesitter',
      config = function()
        require 'configs.treesitter'
      end,
      run = ':TSUpdate',
    }
    use {
      'glepnir/lspsaga.nvim',
      config = function()
        require 'configs.lspsaga'
      end,
    }
    use 'jose-elias-alvarez/nvim-lsp-ts-utils'
    use {
      'ray-x/lsp_signature.nvim',
      config = function()
        require 'configs.lsp-signature'
      end,
    }
    use 'ray-x/navigator.lua'
    use {
      'neovim/nvim-lspconfig',
      requires = {
        { 'hrsh7th/nvim-cmp' },
        { 'williamboman/nvim-lsp-installer' },
      },
      config = function()
        require 'configs.lsp-config'
      end,
    }
    use 'williamboman/nvim-lsp-installer'
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
      config = function()
        require 'configs.nvim-cmp'
      end,
      -- setup =
      -- cmd =
    }
    -- For vsnip users
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'rafamadriz/friendly-snippets'
    -- Lint, Format
    use {
      'jose-elias-alvarez/null-ls.nvim',
      config = function()
        require 'configs.null-ls'
      end,
    }

    use 'mattn/emmet-vim'
    use 'vim-test/vim-test'
    use 'peitalin/vim-jsx-typescript'
    use 'rhysd/git-messenger.vim'
    use {
      'windwp/nvim-ts-autotag',
      config = function()
        require 'configs.autotag'
      end,
    }
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
