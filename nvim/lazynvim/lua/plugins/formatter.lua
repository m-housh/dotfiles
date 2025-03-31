return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stulua" },
      markdown = {
        "prettier",
        prepend_args = {
          "--print-width", "80",
          "--prose-wrap", "always",
          "--parser", "markdown",
        },
      },
      swift = { "swiftformat" },
      --       ["*"] = {
      --         require("formatter.filetypes.any").remove_trailing_whitespace,
      --       },
    },
  },
}
