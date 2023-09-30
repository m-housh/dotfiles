
-- Key maps
require('user.mappings')

-- Common settings
require('user.settings')

-- Auto commands
require('user.autocmd')

-- Plugins
require('user.plugins')
require("telescope").load_extension("lazygit")

-- Theme (must stay after plugins are loaded)
require('user.theme')


