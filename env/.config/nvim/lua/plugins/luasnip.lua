return {
  {
    "L3MON4D3/LuaSnip",
    opts = function()
      LazyVim.cmp.actions.snippet_forward = function()
        if require("luasnip").jumpable(1) then
          require("luasnip").jump(1)
          return true
        end
      end
      LazyVim.cmp.actions.snippet_stop = function()
        if require("luasnip").expand_or_jumpable() then -- or just jumpable(1) is fine?
          require("luasnip").unlink_current()
          return true
        end
      end
    end,
    keys = {
      {
        "<C-k>",
        mode = { "i", "s" },
        function()
          if ls.expand_or_jumpable() then
            ls.expand_or_jump()
          end
        end
      },
      {
        "<C-j>",
        mode = { "i", "s" },
        function()
          if ls.jumpable(-1) then
            ls.jump(-1)
          end
        end
      },
    },
  },
}
