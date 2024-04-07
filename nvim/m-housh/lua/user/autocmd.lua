local defaultGroupOptions = { clear = true }
local markdownGroup = vim.api.nvim_create_augroup("MyMarkdownGroup", defaultGroupOptions)
local spellGroup = vim.api.nvim_create_augroup('SpellGroup', defaultGroupOptions)
local createCmd = vim.api.nvim_create_autocmd
local swiftGroup = vim.api.nvim_create_augroup('swift_lsp', { clear = true })

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

-- Spell check
createCmd(
  "BufEnter",
  {
    pattern = { '*.md', '*.markdown', '*.txt', '*.tex' },
    group = spellGroup,
    callback = function(_)
      vim.cmd.setlocal('textwidth=80')
      vim.cmd.setlocal('spell spelllang=en_us')
    end,
  }
)

-- Markdown
createCmd(
  "BufWritePost",
  {
    pattern = { "*.md", "*.markdown" },
    group = markdownGroup,
    callback = function(_)
      local cursor = vim.fn.getpos('.')
      vim.cmd("FormatWrite")
      vim.fn.setpos('.', cursor)
    end,
  }
)

-- Go
createCmd(
  "BufWritePre",
  {
    pattern = "*.go",
    callback = function()
      require('go.format').goimport()
    end,
    group = vim.api.nvim_create_augroup("GoFormat", defaultGroupOptions)
  }
)

vim.api.nvim_exec([[
  autocmd BufNewFile,BufRead /private/**/gopass** setlocal noswapfile nobackup noundofile shada=""
  ]], false)

-- Swift
-- createCmd(
--   "FileType",
--   {
--     pattern = { 'swift' },
--     callback = function()
--       local root_dir = vim.fs.dirname(vim.fs.find({
--         "Package.swift",
--         ".git",
--       }, { upward = true })[1])
--       local client = vim.lsp.start({
--         name = "sourcekit-lsp",
--         cmd = { "sourcekit-lsp" },
--         root_dir = root_dir
--       })
--       vim.lsp.buf_attach_client(0, client)
--     end,
--     group = swiftGroup
--   }
-- )
