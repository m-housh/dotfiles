return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup({})

    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers').new({}, {
        prompt_title = 'Harpoon',
        finder = require('telescope.finders').new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    -- Keymaps
    vim.keymap.set("n", "<C-e>",
      function() toggle_telescope(harpoon:list()) end,
      { desc = "Open Harpoon window" }
    )

    vim.keymap.set("n", "<leader>a",
      function() harpoon:list():add() end,
      { desc = "[A]dd to harpoon list." }
    )
    vim.keymap.set("n", "<C-e>",
      function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "Toggle quick menu." }
    )

    -- Toggle previous and next buffers.
    vim.keymap.set("n", "<C-S-P>",
      function() harpoon:list():prev() end,
      { desc = "[P]revious harpoon buffer." }
    )
    vim.keymap.set("n", "<C-S-N>",
      function() harpoon:list():next() end,
      { desc = "[N]ext harpoon buffer." }
    )
  end
}
