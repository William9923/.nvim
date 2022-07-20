-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Install plugins
return packer.startup(function(use)
  -- Add you plugins here:
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- Indent line
  use 'lukas-reineke/indent-blankline.nvim'


  -- Treesitter interface
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'windwp/nvim-ts-autotag',
  }
   -- Autopair
  use {
    'windwp/nvim-autopairs',
  }

  -- -- Color schemes
  use 'navarasu/onedark.nvim'

  -- LSP (Language Server)
  use ({
    "williamboman/nvim-lsp-installer",
    config = function()
      require("nvim-lsp-installer").setup({
        automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
        ui = {
            icons = {
                server_installed = "✓",
                server_pending = "➜",
                server_uninstalled = "✗"
              }
            }
        })
      end,
  })
  use 'neovim/nvim-lspconfig'
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
  })
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  -- use 'folke/lsp-colors.nvim'
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for

  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
    },
  }
  use 'hrsh7th/cmp-nvim-lua'

  -- Snippet
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Statusline
  use {
    'feline-nvim/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- git labels
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- telescope (fast finding files...)
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { 'nvim-lua/plenary.nvim'},
  }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  -- alpha : Neovim Dashboard (for opening intro IDE)
  use 'goolord/alpha-nvim'

  -- comment utility plugins
  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- barbar (window bar management)
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- NvimTree(File Explorer)
  use "kyazdani42/nvim-tree.lua"
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
