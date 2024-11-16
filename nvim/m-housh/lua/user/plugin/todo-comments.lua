return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = { },
  config = function()
    require('todo-comments').setup({})

    vim.keymap.set('n', '<leader>tq', '<CMD>TodoQuickFix<CR>',
      { desc = "[T]odo [Q]uick fix list." }
    )
    vim.keymap.set('n', '<leader><leader>t', '<CMD>TodoTelescope<CR>',
      { desc = "[T]odo [Q]uick fix list." }
    )
  end,
}
