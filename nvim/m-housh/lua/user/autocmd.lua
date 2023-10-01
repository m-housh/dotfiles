-- Remove all trailing whitespace on save
vim.api.nvim_exec([[
  augroup TrimWhiteSpace
    au!
    autocmd BufWritePre * :%s/\s\+$//e
  augroup END
  ]], false)

-- Prevent new line to also start with a comment
vim.api.nvim_exec([[
  augroup NewLineComment
    au!
    au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  augroup END
  ]], false)

-- Wrap markdown lines when a buffer is written.
local markdownGroup = vim.api.nvim_create_augroup("MyMarkdownGroup", { clear = true })

vim.api.nvim_create_autocmd(
  "BufEnter",
  {
    pattern = { "*.md", "*.markdown" },
    command = "setlocal textwidth=80",
    group = markdownGroup
  }
)
vim.api.nvim_create_autocmd(
  "BufWritePre",
  {
    pattern = { "*.md", "*.markdown" },
    command = ":normal ggVGgq",
    group = markdownGroup
  }
)

vim.api.nvim_create_autocmd(
  "BufWritePre",
  {
    pattern = "*.go",
    callback = function()
      require('go.format').goimport()
    end,
    group = vim.api.nvim_create_augroup("GoFormat", { clear = true })
  }
)

