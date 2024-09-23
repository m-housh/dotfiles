return {
  {
    "williamboman/nvim-lsp-installer",
    config = function()
      require("nvim-lsp-installer").setup({})
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "onsails/lspkind-nvim",
      "famiu/bufdelete.nvim",
      "ray-x/lsp_signature.nvim",
      "neovim/nvim-lspconfig",
      "folke/neodev.nvim",
      "mhartington/formatter.nvim",
      "ray-x/go.nvim",
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
          "marksman",
          "terraformls",
          "ts_ls",
          "texlab",
          "yamlls",
        }
    }
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require('neodev').setup()
      require("mason").setup()
      require("mason-lspconfig").setup()
      local nvim_lsp = require("lspconfig")

      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function(bufnr)
          local function buf_set_keymap(...)
              vim.api.nvim_buf_set_keymap(bufnr, ...)
          end

          -- Mappings.
          local opts = {noremap = true, silent = true}

          -- See `:help vim.lsp.*` for documentation on any of the below functions
          buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
          buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
          buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
          buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
          buf_set_keymap("n", "gT", vim.lsp.buf.type_definition, opts)
          -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
          buf_set_keymap("n", "<space>wa",
                         "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
          buf_set_keymap("n", "<space>wr",
                         "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
          buf_set_keymap("n", "<space>wl",
                         "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
                         opts)
          buf_set_keymap("n", "<space>D",
                         "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
          buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
          buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>",
                         opts)
          buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
          buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
          buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)

          buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
          buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
          buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

          vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      end

      -- Use a loop to conveniently call 'setup' on multiple servers and
      -- map buffer local keybindings when the language server attaches
      --local capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local servers = {
          "bashls",
          "clangd",
          "dockerls",
          "gopls",
          "jsonls",
          "jedi_language_server",
          "lua_ls",
          "marksman",
          "sourcekit",
          "terraformls",
          "ts_ls",
          "texlab",
          "yamlls",
      }
      for _, lsp in ipairs(servers) do
          nvim_lsp[lsp].setup {
              on_attach = on_attach,
              capabilities = capabilities,
              settings = {
                  gopls = {
                    experimentalPostfixCompletions = true,
                    analyses = {
                      unusedparams = true,
                      shadow = true
                    },
                    staticcheck = true
                  },
                  lua_ls = {
                    Lua = {
                      completion = {
                        callSnippet = "Replace"
                      },
                      workspace = { checkThirdParty = false },
                      telemetry = { enable = false },
                    }
                  },
                  json = {
                      format = {enabled = false},
                      schemas = {
                          {
                              description = "ESLint config",
                              fileMatch = {".eslintrc.json", ".eslintrc"},
                              url = "http://json.schemastore.org/eslintrc"
                          }, {
                              description = "Package config",
                              fileMatch = {"package.json"},
                              url = "https://json.schemastore.org/package"
                          }, {
                              description = "Packer config",
                              fileMatch = {"packer.json"},
                              url = "https://json.schemastore.org/packer"
                          }, {
                              description = "Renovate config",
                              fileMatch = {
                                  "renovate.json", "renovate.json5",
                                  ".github/renovate.json", ".github/renovate.json5",
                                  ".renovaterc", ".renovaterc.json"
                              },
                              url = "https://docs.renovatebot.com/renovate-schema"
                          }, {
                              description = "OpenApi config",
                              fileMatch = {"*api*.json"},
                              url = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"
                          }
                      }
                  },
                  redhat = {telemetry = {enabled = false}},
                  texlab = {
                      auxDirectory = ".",
                      bibtexFormatter = "texlab",
                      build = {
                          args = {
                              "--keep-intermediates", "--keep-logs", "--synctex", "%f"
                          },
                          executable = "tectonic",
                          forwardSearchAfter = false,
                          onSave = false
                      },
                      chktex = {onEdit = false, onOpenAndSave = false},
                      diagnosticsDelay = 300,
                      formatterLineLength = 80,
                      forwardSearch = {args = {}},
                      latexFormatter = "latexindent",
                      latexindent = {modifyLineBreaks = false}
                  },
                  yaml = {
                      schemaStore = {
                          enable = true,
                          url = "https://www.schemastore.org/api/json/catalog.json"
                      },
                      schemas = {
                          kubernetes = "/*.yaml",
                          ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
                          ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                          ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                          ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
                          ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                          ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
                          ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
                          ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
                          ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
                          ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
                          ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.{yml,yaml}",
                          ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}"
                      },
                      format = {enabled = false},
                      validate = false, -- TODO: conflicts between Kubernetes resources and kustomization.yaml
                      completion = true,
                      hover = true
                  }
              },
              flags = {debounce_text_changes = 150}
          }
          require"lsp_signature".setup({
              bind = true, -- This is mandatory, otherwise border config won't get registered.
              floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
              doc_lines = 2, -- Set to 0 for not showing doc
              hint_prefix = "🐼 ",
              -- use_lspsaga = false,  -- set to true if you want to use lspsaga popup
              handler_opts = {
                  border = "shadow" -- double, single, shadow, none
              }
          })
      end

      -- Test source-kit
      require('lspconfig').sourcekit.setup{}

    end
  }
}
