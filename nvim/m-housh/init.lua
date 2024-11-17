-- Leader needs to be set before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Auto commands
require("user.autocmd")

-- Plugins
require("user.plugins")

-- Key maps
require("user.keymaps")

-- Theme (must stay after plugins are loaded)
require("user.theme")

-- Common settings
require("user.settings")

-- Snippets are setup in the luasnip settings, they get loaded from the snippets directory
-- based on filetype.
--require("user.snippets")

vim.o.shiftwidth = 2
