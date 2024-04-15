return {
  "hrsh7th/nvim-cmp",
  enabled = true,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
    'saadparwaiz1/cmp_luasnip',
    "f3fora/cmp-spell",
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-emoji",
    --"L3MON4D3/LuaSnip",

    -- Adds a number of user-friendly snippets
    'rafamadriz/friendly-snippets',
  },
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    -- Setup nvim-cmp.
    local cmp = require "cmp"
    local lspkind = require("lspkind")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    --local luasnip = require('luasnip')

    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
                   and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(
                       col, col):match("%s") == nil
    end

    local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true),
                              mode, true)
    end


    require('lspconfig').sourcekit.setup {
      capabilities = capabilities
    }

    lspkind.init({
        symbol_map = {

            Text = "",
            Method = "󰡱",
            Function = "󰡱",
            Constructor = "",
            Field = "ﰠ",
            Variable = "",
            Class = "ﴯ",
            Interface = "",
            Module = "",
            Property = "ﰠ",
            Unit = "塞",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "פּ",
            Event = "",
            Operator = "",
            TypeParameter = ""
        }
    })

    -- Configure nvim-cmp.
    --require('luasnip.loaders.from_vscode').lazy_load()
    --luasnip.config.setup {}
    cmp.setup({
        formatting = {
            format = lspkind.cmp_format {
                with_text = false,
                maxwidth = 50,
                menu = {
                    buffer = "BUF",
                    nvim_lsp = "LSP",
                    path = "PATH",
                    vsnip = "SNIP",
                    calc = "CALC",
                    spell = "SPELL",
                    emoji = "EMOJI"
                }
            }
        },
        experimental = {native_menu = false, ghost_text = false},
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
            --luasnip.lsp_expand(args.body)
            --require('luasnip').lsp_expand(args.body)
          end
        },
        mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true
            },
            -- Accept ([y]es) the completions.
            ['<C-y'] = cmp.mapping.confirm { select = true },
--             ["<Tab>"] = cmp.mapping(function(fallback)
--               if cmp.visible() then
--                 cmp.select_next_item()
-- --               elseif luasnip.expandable() then
-- --                 luasnip.expand()
-- --               elseif luasnip.expand_or_jumpable() then
-- --                 luasnip.expand_or_jump()
--               elseif has_words_before() then
--                 cmp.complete()
--               else
--                 fallback()
--               end
--             end, {"i", "s"}),
            ["<S-Tab>"] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.select_prev_item()
--                 elseif vim.fn["vsnip#jumpable"](-1) == 1 then
--                     feedkey("<Plug>(vsnip-jump-prev)", "")
                end
            end, {"i", "s"})
         },
        sources = {
          {name = "nvim_lsp"},
          {name = "buffer", keyword_length = 5},
          {name = 'luasnip', option = { show_autosnippets = true } },
          {name = "calc"},
          {name = "emoji"},
          {name = "spell"},
          {name = "path"}
        }
    })

    -- Use buffer source for `/`.
    cmp.setup.cmdline("/", {sources = {{name = "buffer"}}})

    -- Use cmdline & path source for ':'.
    cmp.setup.cmdline(":", {
        sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}})
    })
    end
  }
