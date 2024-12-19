return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    },
    keys = {
      {
        "<C-e>",
        function()
          require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
        end,
        desc = "Open Harpoon window.",
      },
      {
        "<leader>a",
        function()
          require("harpoon"):list():add()
        end,
        desc = "[A]dd to the harpoon list.",
      },
      {
        "<A-y>",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "Select first harpoon buffer.",
      },
      {
        "<A-u>",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "Select second harpoon buffer.",
      },
      {
        "<A-i>",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "Select third harpoon buffer.",
      },
      {
        "<A-o>",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "Select fourth harpoon buffer.",
      },
      {
        "<C-[>",
        function()
          require("harpoon"):list():prev()
        end,
        desc = "Previous harpoon buffer.",
      },
      {
        "<C-]>",
        function()
          require("harpoon"):list():next()
        end,
        desc = "Next harpoon buffer.",
      },
      -- Extensions
      require("harpoon"):extend({
        UI_CREATE = function(cx)
          vim.keymap.set("n", "<C-v>", function()
            require("harpoon").ui:select_menu_item({ vsplit = true })
          end, { buffer = cx.buffer, desc = "Open in [V]split" })
        end,
      }),
    },
  },
}
