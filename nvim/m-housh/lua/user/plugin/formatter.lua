return {
  "mhartington/formatter.nvim",
  config = function()
    local util = require("formatter.util")
    require("formatter").setup({
      filetype = {
        markdown = {
            exe = "prettier",
            args = {
              "--stdin-filepath",
              util.escape_path(util.get_current_buffer_file_path()),
              "--line-width",
              "100"
            },
            try_node_modules = true,
        },
        ["*"] = {
          -- formatter for any / all file types.
          require("formatter.filetypes.any").remove_trailing_whitespace
        }
      }
    })
  end
}
