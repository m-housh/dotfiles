-- Leader needs to be set before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Auto commands
require('user.autocmd')

-- Plugins
require('user.plugins')

-- Key maps
require('user.mappings')

-- Theme (must stay after plugins are loaded)
require('user.theme')

-- Common settings
require('user.settings')

vim.o.shiftwidth = 2

