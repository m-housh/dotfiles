-- This file contains plugin's that don't require much configuration.
return {
--   {
--     "L3MON4D3/LuaSnip",
--     version = "2.*",
--     build = "make install_jsregexp",
--     event = { 'BufReadPre', 'BufNewFile' },
--     config = function()
--       local luasnip = require('luasnip')
--       local types = require('luasnip.util.types')
--       luasnip.config.set_config {
--         history = true,
--         updateevents = "TextChanged,TextChangedI",
--         enable_autosnippets = true,
--         ext_opts = {
--           [types.choiceNode] = {
--             active = {
--               virt_text = { { "<-", "Error" } },
--             },
--           },
--         },
--       }
--     end
--   },
  {
	  "hrsh7th/vim-vsnip",
	  config = function()
      vim.g.vsnip_snippet_dir = os.getenv('HOME') .. '/.config/m-housh/lua/snippets/'
    end
  },
}
