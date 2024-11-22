-- Leader needs to be set before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NOTE: Keep settings at the top, otherwise some options don't work well.
--       mainly have had trouble with not using the settings in an `.editorconfig`
--       file for projects.

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
