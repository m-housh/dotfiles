return {
    "andrewferrier/wrapping.nvim",
    opts = {
      auto_set_mode_filetype_allowlist = {
        "asciidoc",
        "gitcommit",
        "latex",
        "markdown",
        "tex",
        "text"
      },
    },
    config = function()
      require("wrapping").setup({
        softener = {
          markdown = 1.3
        },
      })
   end
  }
