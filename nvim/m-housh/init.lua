-- Leader needs to be set before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NOTE: Keep settings at the top, otherwise some options don't work well.
--       mainly have had trouble with not using the settings in an `.editorconfig`
--       file for projects.

-- Common settings
require("config.settings")

-- Auto commands
require("config.autocmd")

-- Plugins
require("config.lazy")

-- Key maps
require("config.keymaps")

-- Theme (must stay after plugins are loaded)
require("config.theme")
