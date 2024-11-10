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
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall", "LspStart", "LspStop", "LspRestart" },
    config = function()
      require('neodev').setup()
      require("mason").setup()
      require("mason-lspconfig").setup()
      local lspconfig = require('lspconfig')

      lspconfig.bashls.setup {}
      lspconfig.clangd.setup {}
      lspconfig.dockerls.setup {}
      lspconfig.gopls.setup {}
      lspconfig.jsonls.setup {}
      lspconfig.lua_ls.setup {}
      lspconfig.marksman.setup {}
      lspconfig.yamlls.setup {}
      lspconfig.sourcekit.setup({
        capabilities = {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        },
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP Actions',
        callback = function(args)
          -- Configure keybindings once we've attached.
          local wk = require('which-key')

          wk.add({
            { "<C-k>", vim.lsp.buf.hover, desc = "LSP hover info" },
            { "gd", vim.lsp.buf.definition, desc = "[G]oto [D]efinition" },
            { "gD", vim.lsp.buf.declaration, desc = "[G]oto [D]eclaration" },
            { "gi", vim.lsp.buf.implementation, desc = "[G]oto [I]mplementation" },
            { "gr", vim.lsp.buf.references, desc = "List [R]eferences" },
            {"gs", vim.lsp.buf.signature_help, desc = "[S]ignature help" },
            { "<space>rn", vim.lsp.buf.rename, desc = "[R]e[N]ame" },
            { "[d", vim.diagnostic.goto_prev, desc = "Go to previous diagnostic" },
            { "]d", vim.diagnostic.goto_prev, desc = "Go to next diagnostic" },
          }, {
            mode = 'n',
            silent = true
          })
        end,
      })
    end
  }
}
-- return {
--   {
--     "williamboman/nvim-lsp-installer",
--     config = function()
--       require("nvim-lsp-installer").setup({})
--     end
--   },
--   {
--     "williamboman/mason-lspconfig.nvim",
--     dependencies = {
--       "williamboman/mason.nvim",
--       "onsails/lspkind-nvim",
--       "famiu/bufdelete.nvim",
--       "ray-x/lsp_signature.nvim",
--       "neovim/nvim-lspconfig",
--       "folke/neodev.nvim",
--       "mhartington/formatter.nvim",
--       "ray-x/go.nvim",
--     },
--     opts = {
--         ensure_installed = {
--           "bashls",
--           "clangd",
--           "dockerls",
--           "gopls",
--           "jsonls",
--           "jedi_language_server",
--           "lua_ls",
--           "marksman",
--           "terraformls",
--           "ts_ls",
--           "texlab",
--           "yamlls",
--         }
--     }
--   },
--   {
--     "neovim/nvim-lspconfig",
--     dependencies = {
--       "hrsh7th/cmp-nvim-lsp",
--     },
--     config = function()
--       require('neodev').setup()
--       require("mason").setup()
--       require("mason-lspconfig").setup()
--       local nvim_lsp = require("lspconfig")
--       local telescope_builtin = require('telescope.builtin')
--
--       vim.api.nvim_create_autocmd('LspAttach', {
--         group = vim.api.nvim_create_augroup('my-lsp-attach', { clear = true }),
--         callback = function(event)
--           -- Helper function to create a keymap.
--           local map = function(keys, func, desc)
--             vim.keymap.set('n', keys, func, { buffer = true, desc = 'LSP: ' .. desc })
--           end
--
--           -- Mappings.
--           -- See `:help vim.lsp.*` for documentation on any of the below functions
--
--           map('[d', '<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>', 'Goto previous')
--           map(']d', '<CMD>lua vim.lsp.diagnostic.goto_next()<CR>', 'Goto next')
--           map('<space>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
--           map('<space>rn', vim.lsp.buf.rename, '[R]e[n]ame')
--           map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
--           map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
--           map('gi', telescope_builtin.lsp_implementations, '[G]oto, [I]mplementation')
--           map('gr', telescope_builtin.lsp_references, '[G]oto [R]eferences')
--           map('gt', telescope_builtin.lsp_type_definitions, '[T]ype Definitions')
--           map('K', vim.lsp.buf.hover, 'Hover Documentation')
--
-- --           -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
-- --           buf_set_keymap("n", "<space>wa",
-- --                          "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
-- --           buf_set_keymap("n", "<space>wr",
-- --                          "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
-- --           buf_set_keymap("n", "<space>wl",
-- --                          "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
-- --                          opts)
-- --           buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
-- --           buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
--           vim.api.nvim_buf_set_option(event.buf, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--         end,
--       })
--
--       -- Use a loop to conveniently call 'setup' on multiple servers and
--       -- map buffer local keybindings when the language server attaches
--       local capabilities = vim.lsp.protocol.make_client_capabilities()
--       capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
--
--       local servers = {
--           "bashls",
--           "clangd",
--           "dockerls",
--           "gopls",
--           "jsonls",
--           "jedi_language_server",
--           "lua_ls",
--           "marksman",
--           "sourcekit",
--           "terraformls",
--           "ts_ls",
--           "texlab",
--           "yamlls",
--       }
--
--       for _, lsp in ipairs(servers) do
--           nvim_lsp[lsp].setup {
--               capabilities = capabilities,
--               settings = {
--                   gopls = {
--                     experimentalPostfixCompletions = true,
--                     analyses = {
--                       unusedparams = true,
--                       shadow = true
--                     },
--                     staticcheck = true
--                   },
--                   lua_ls = {
--                     Lua = {
--                       completion = {
--                         callSnippet = "Replace"
--                       },
--                       workspace = { checkThirdParty = false },
--                       telemetry = { enable = false },
--                     }
--                   },
--                   json = {
--                       format = {enabled = false},
--                       schemas = {
--                           {
--                               description = "ESLint config",
--                               fileMatch = {".eslintrc.json", ".eslintrc"},
--                               url = "http://json.schemastore.org/eslintrc"
--                           }, {
--                               description = "Package config",
--                               fileMatch = {"package.json"},
--                               url = "https://json.schemastore.org/package"
--                           }, {
--                               description = "Packer config",
--                               fileMatch = {"packer.json"},
--                               url = "https://json.schemastore.org/packer"
--                           }, {
--                               description = "Renovate config",
--                               fileMatch = {
--                                   "renovate.json", "renovate.json5",
--                                   ".github/renovate.json", ".github/renovate.json5",
--                                   ".renovaterc", ".renovaterc.json"
--                               },
--                               url = "https://docs.renovatebot.com/renovate-schema"
--                           }, {
--                               description = "OpenApi config",
--                               fileMatch = {"*api*.json"},
--                               url = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"
--                           }
--                       }
--                   },
--                   redhat = {telemetry = {enabled = false}},
--                   texlab = {
--                       auxDirectory = ".",
--                       bibtexFormatter = "texlab",
--                       build = {
--                           args = {
--                               "--keep-intermediates", "--keep-logs", "--synctex", "%f"
--                           },
--                           executable = "tectonic",
--                           forwardSearchAfter = false,
--                           onSave = false
--                       },
--                       chktex = {onEdit = false, onOpenAndSave = false},
--                       diagnosticsDelay = 300,
--                       formatterLineLength = 80,
--                       forwardSearch = {args = {}},
--                       latexFormatter = "latexindent",
--                       latexindent = {modifyLineBreaks = false}
--                   },
--                   yaml = {
--                       schemaStore = {
--                           enable = true,
--                           url = "https://www.schemastore.org/api/json/catalog.json"
--                       },
--                       schemas = {
--                           kubernetes = "/*.yaml",
--                           ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
--                           ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
--                           ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
--                           ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
--                           ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
--                           ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
--                           ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
--                           ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
--                           ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
--                           ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
--                           ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.{yml,yaml}",
--                           ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}"
--                       },
--                       format = {enabled = false},
--                       validate = false, -- TODO: conflicts between Kubernetes resources and kustomization.yaml
--                       completion = true,
--                       hover = true
--                   }
--               },
--               flags = {debounce_text_changes = 150}
--           }
--           require"lsp_signature".setup({
--               bind = true, -- This is mandatory, otherwise border config won't get registered.
--               floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
--               doc_lines = 2, -- Set to 0 for not showing doc
--               hint_prefix = "🐼 ",
--               -- use_lspsaga = false,  -- set to true if you want to use lspsaga popup
--               handler_opts = {
--                   border = "shadow" -- double, single, shadow, none
--               }
--           })
--       end
--
--       -- Test source-kit
--       require('lspconfig').sourcekit.setup{
--         capabilities = {
--           workspace = {
--             didChangeWatchedFiles = {
--               dynamicRegistration = true
--             }
--           }
--         }
--       }
--
--     end
--   }
-- }
