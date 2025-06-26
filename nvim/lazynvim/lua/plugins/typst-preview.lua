return {
  'chomosuke/typst-preview.nvim',
  ft = 'typst', -- or ft = 'typst'
  version = '1.*',
  opts = {
    debug = true,
  }, -- lazy.nvim will implicitly calls `setup {}`
  keys = {
    {
      "<leader>tp",
      "<CMD>TypstPreviewToggle<CR>",
      desc = "Toggle typst preview."
    },
  }
}
