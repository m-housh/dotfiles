return {
    "andrewferrier/wrapping.nvim",
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      auto_set_mode_filetype_allowlist = {
        "asciidoc",
        "gitcommit",
        "latex",
        "markdown",
        "tex",
        "text"
      },
      softener = {
        markdown = 1.3
      },
    },
  }
