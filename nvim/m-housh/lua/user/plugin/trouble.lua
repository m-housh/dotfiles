return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>tt", "<cmd>Trouble quickfix toggle<cr>", { desc = "Open a quickfix" } },
  },

  opts = {},
  config = function()
    require("trouble").setup({
      auto_open = false,
      auto_close = false,
      auto_preview = true,
      auto_jump = false,
      mode = "quickfix",
      severity = vim.diagnostic.severity.ERROR,
      cycle_results = false,
    })
    -- Jump to diagnostic issues across the whole project.
    vim.keymap.set("n", "<A-d>", "<cmd>silent cc | silent cn<cr>zz", { desc = "Jump to next issue" })
    vim.keymap.set("n", "<A-s>", "<cmd>silent cc | silent cp<cr>zz", { desc = "Jump to previous issue" })
  end,
}
