-- Plugins that don't require much configuration are in here.
--
return {
  { import = "lazyvim.plugins.extras.lang.ansible" },
  { import = "lazyvim.plugins.extras.lang.cmake" },
  { import = "lazyvim.plugins.extras.lang.docker" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.markdown" },
  { import = "lazyvim.plugins.extras.lang.yaml" },
  { import = "lazyvim.plugins.extras.coding.luasnip" },
  {
    import = "lazyvim.plugins.extras.editor.mini-files",
    opts = {
      options = {
        use_as_default_explorer = true,
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      indent = { enabled = false },
    },
  },
  {
    import = "lazyvim.plugins.extras.coding.blink",
    keymap = {
      preset = "enter",
      ["<C-y>"] = { "select_and_accept" },
    },
  },
}
