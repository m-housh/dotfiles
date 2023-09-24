return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "onsails/lspkind-nvim",
      "famiu/bufdelete.nvim",
      "ray-x/lsp_signature.nvim",
      "neovim/nvim-lspconfig"
    },
    opts = {
        ensure_installed = {
          "bashls",
          "clangd",
          "dockerls",
          "gopls",
          "jsonls",
          "jedi_language_server",
          "lua_ls",
          "terraformls",
          "tsserver",
          "texlab",
          "yamlls",
        }
    }
  }
