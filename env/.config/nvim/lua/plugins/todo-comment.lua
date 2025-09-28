return {
  "folke/todo-comments.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
  },
  keys = {
    { "<leader>xt", false },
    { "<leader>xT", false },
    { "<leader>tq", "<CMD>Trouble todo toggle<CR>", desc = "[T]odo [Q]uick fix list." },
    { "<leader><leader>t", "<CMD>TodoTelescope<CR>", desc = "[T]odo telescope list." },
    { "<leader>tl", "<CMD>TodoLocList<CR>", desc = "[T]odo [L]ocation list." },
  },
}
