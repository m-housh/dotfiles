local defaultGroupOptions = { clear = true }
local markdownGroup = vim.api.nvim_create_augroup("MyMarkdownGroup", defaultGroupOptions)
local createCmd = vim.api.nvim_create_autocmd

createCmd("BufEnter", {
  pattern = "*.md",
  group = markdownGroup,
  callback = function(_)
    -- HACK: Set filetype to markdown for '.md' files.
    -- Not sure why it doesn't detect these as markdown files, but this fixes the issue.
    vim.cmd.setlocal("filetype=markdown")
    vim.cmd.setlocal("textwidth=80")
    vim.cmd.setlocal("spell spelllang=en_us")
  end,
})

-- Hyprlang LSP
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.hl", "hypr*.conf" },
  callback = function(event)
    print(string.format("starting hyprls for %s", vim.inspect(event)))
    vim.lsp.start({
      name = "hyprlang",
      cmd = { "hyprls" },
      root_dir = vim.fn.getcwd(),
    })
  end,
})

-- Markdown
-- createCmd("BufWritePost", {
--   pattern = { "*.md", "*.markdown" },
--   group = markdownGroup,
--   callback = function(_)
--     -- local cursor = vim.fn.getpos(".")
--     vim.cmd("FormatWrite")
--     -- vim.fn.setpos(".", cursor)
--   end,
-- })

-- Go
createCmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require("go.format").goimport()
  end,
  group = vim.api.nvim_create_augroup("GoFormat", defaultGroupOptions),
})

-- GoPass
vim.api.nvim_exec2(
  [[
  autocmd BufNewFile,BufRead /private/**/gopass** setlocal noswapfile nobackup noundofile shada=""
  ]],
  {}
)

-- Highlight when yanking.
createCmd("TextYankPost", {
  desc = "Highlight when yanking text.",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*",
  callback = function(args)
    local first_line = vim.api.nvim_buf_get_lines(args.buf, 0, 1, false)[1] or ""
    if first_line:match("^#!.*zsh") then
      vim.bo[args.buf].filetype = "bash"
    end
  end,
})
