return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- TODO: This is implemented in LuaSnip config, does it need to be here?

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
				-- TODO:
				-- The next two mappings are also implemented in the LuaSnip configuration,
				-- as <C-j> and <C-k> do they actually need to be here??
				["<C-b>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-f>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),
			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
-- return {
-- 	"hrsh7th/nvim-cmp",
-- 	enabled = true,
-- 	dependencies = {
-- 		"hrsh7th/cmp-nvim-lsp",
-- 		"hrsh7th/cmp-buffer",
-- 		"hrsh7th/cmp-path",
-- 		"hrsh7th/cmp-cmdline",
-- 		"hrsh7th/cmp-vsnip",
-- 		"hrsh7th/vim-vsnip",
-- 		"saadparwaiz1/cmp_luasnip",
-- 		"f3fora/cmp-spell",
-- 		"hrsh7th/cmp-calc",
-- 		"hrsh7th/cmp-emoji",
-- 		"L3MON4D3/LuaSnip",
-- 		-- Adds a number of user-friendly snippets
-- 		"rafamadriz/friendly-snippets",
-- 		"onsails/lspkind.nvim", -- vs-code like pictograms
-- 	},
-- 	event = { "BufReadPre", "BufNewFile" },
-- 	config = function()
-- 		-- Setup nvim-cmp.
-- 		local cmp = require("cmp")
-- 		local lspkind = require("lspkind")
-- 		local capabilities = vim.lsp.protocol.make_client_capabilities()
-- 		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
-- 		local luasnip = require("luasnip")
-- 		require("luasnip.loaders.from_vscode").lazy_load()
--
-- 		require("lspconfig").sourcekit.setup({
-- 			capabilities = capabilities,
-- 		})
--
-- 		lspkind.init({
-- 			symbol_map = {
--
-- 				Text = "",
-- 				Method = "󰡱",
-- 				Function = "󰡱",
-- 				Constructor = "",
-- 				Field = "ﰠ",
-- 				Variable = "",
-- 				Class = "ﴯ",
-- 				Interface = "",
-- 				Module = "",
-- 				Property = "ﰠ",
-- 				Unit = "塞",
-- 				Value = "",
-- 				Enum = "",
-- 				Keyword = "",
-- 				Snippet = "",
-- 				Color = "",
-- 				File = "",
-- 				Reference = "",
-- 				Folder = "",
-- 				EnumMember = "",
-- 				Constant = "",
-- 				Struct = "פּ",
-- 				Event = "",
-- 				Operator = "",
-- 				TypeParameter = "",
-- 			},
-- 		})
--
-- 		cmp.setup({
-- 			completion = {
-- 				completeopt = "menu,menuone,preview",
-- 			},
-- 			snippet = { -- configure how nvim-cmp interacts with snippet engine
-- 				expand = function(args)
-- 					luasnip.lsp_expand(args.body)
-- 				end,
-- 			},
-- 			mapping = cmp.mapping.preset.insert({
-- 				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
-- 				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
-- 				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
-- 				["<C-e>"] = cmp.mapping.abort(), -- close completion window
-- 				["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
-- 				["<C-b>"] = cmp.mapping(function(fallback)
-- 					if luasnip.jumpable(-1) then
-- 						luasnip.jump(-1)
-- 					else
-- 						fallback()
-- 					end
-- 				end, { "i", "s" }),
-- 				["<C-f>"] = cmp.mapping(function(fallback)
-- 					if luasnip.jumpable(1) then
-- 						luasnip.jump(1)
-- 					else
-- 						fallback()
-- 					end
-- 				end, { "i", "s" }),
-- 			}),
-- 			-- sources for autocompletion
-- 			sources = cmp.config.sources({
-- 				{ name = "nvim_lsp" },
-- 				{ name = "luasnip" }, -- snippets
-- 				{ name = "buffer" }, -- text within current buffer
-- 				{ name = "path" }, -- file system paths
-- 				--{ name = "calc" },
-- 				--{ name = "emoji" },
-- 				--{ name = "spell" },
-- 			}),
-- 			-- configure lspkind for vs-code like pictograms in completion menu
-- 			formatting = {
-- 				expandable_indicator = true,
-- 				fields = { "abbr", "kind", "menu" },
-- 				format = lspkind.cmp_format({
-- 					maxwidth = 50,
-- 					ellipsis_char = "...",
-- 				}),
-- 			},
-- 		})
-- 	end,
-- }
