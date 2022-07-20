--[[
Neovim init file
Author: William
Inspiration:
- https://github.com/brainfucksec/neovim-lua
- https://github.com/craftzdog/dotfiles-public
- https://github.com/LunarVim/Neovim-from-scratch
--]]

-- Import Lua Plugins
require('plugins')
-- Core Functionality
require('core/autocmds')
require('core/colors')
require('core/keymaps')
require('core/lsp')
require('core/options')
require('core/statusline')
-- Plugins
require('plugins/alpha')
require('plugins/autopairs')
require('plugins/comment')
require('plugins/gitsigns')
require('plugins/indent-blankline')
require('plugins/nvim-cmp')
require('plugins/nvim-treesitter')
require('plugins/telescope')
require('plugins.nvim-tree')
require('plugins.nvim-autotag')
