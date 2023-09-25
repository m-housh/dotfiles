-- This file contains plugin's that don't require much configuration.
return {
--   {
-- 	  "hrsh7th/vim-vsnip",
-- 	  config = function()
--       vim.g.vsnip_snippet_dir = os.getenv('HOME') .. '/.config/m-housh/snippets/'
--     end
--   },
--   {
--     dir = "~/LocalProjects/plugins/m-housh/swift.nvim"
--   }
  {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    build = "make install_jsregexp",
    config = function()
      local luasnip = require('luasnip')
      local types = require('luasnip.util.types')
      luasnip.config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
        ext_opts = {
          [types.choiceNode] = {
            active = {
              virt_text = { { "<-", "Error" } },
            },
          },
        },
      }
    end
  }
}
