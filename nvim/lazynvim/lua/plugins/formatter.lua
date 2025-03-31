return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stulua" },
      markdown = {
        "prettier",
        prepend_args = {
          "--config", "~/.prettierrc.yaml"
        },
      },
      swift = { "swiftformat" },
      --       ["*"] = {
      --         require("formatter.filetypes.any").remove_trailing_whitespace,
      --       },
    },
  },
}
