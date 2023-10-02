return {
  "mhartington/formatter.nvim",
  config = function()
    local util = require("formatter.util")
    require("formatter").setup({
      filetype = {
        markdown = function()
          return {
            exe = "prettier",
            args = {
              "--stdin-filepath",
              util.escape_path(util.get_current_buffer_file_path()),
              "--print-width",
              "80",
              "--prose-wrap",
              "always",
              "--parser",
              "markdown"
            },
            stdin = true,
            try_node_modules = true,
          }
        end,
        ["*"] = {
          -- formatter for any / all file types.
          require("formatter.filetypes.any").remove_trailing_whitespace
        }
      }
    })
  end
}
