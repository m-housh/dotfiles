-- Leader needs to be set before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Common settings
require("user.settings")

-- Auto commands
require("user.autocmd")

-- Plugins
require("user.plugins")

-- Key maps
require("user.keymaps")

-- Theme (must stay after plugins are loaded)
require("user.theme")
