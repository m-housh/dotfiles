return {
    'm-housh/swift.nvim',
    dependencies = {
      'akinsho/toggleterm.nvim'
    },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('swift').setup()
      local default_options = { noremap = true, silent = true }
      local actions = require('swift.actions')

      vim.keymap.set('n', '<c-b>', actions.build, default_options)
      vim.keymap.set('n', '<c-u>', actions.test, default_options)
    end
  }
