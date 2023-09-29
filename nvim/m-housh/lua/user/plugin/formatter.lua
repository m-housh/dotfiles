return {
  "mhartington/formatter.nvim",
  config = function()
    local util = require("formatter.util")
    require("formatter").setup({
      filetype = {
        markdown = {
          require("formatter.filetypes.markdown").prettier
        },
        ["*"] = {
          -- formatter for any / all file types.
          require("formatter.filetypes.any").remove_trailing_whitespace
        }
      }
    })
  end
}
