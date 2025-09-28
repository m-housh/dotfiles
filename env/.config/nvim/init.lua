-- bootstrap lazy.nvim, LazyVim and your plugin
vim.g.netrw_browsex_viewer = "xdg-open"

require("config.lazy")

vim.filetype.add({
  pattern = {
    [".*"] = function(path, bufnr)
      local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ""
      if first_line:match("^#!.*zsh") then
        return "bash"
      end
    end,
  },
})
