-- The language servers to setup.
local lsp_servers = {
	"bashls",
	"clangd",
	"dockerls",
	"gopls",
	"jsonls",
	"lua_ls",
	"marksman",
	"sourcekit",
	"yamlls",
}

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			opts = {
				ensure_installed = lsp_servers,
			},
		})
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()
		local opts = { noremap = true, silent = true }
		local on_attach = function(_, bufnr)
			opts.buffer = bufnr

			opts.desc = "Show line diagnostics"
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

			opts.desc = "Show diagnostics in Telescope"
			vim.keymap.set("n", "<leader><leader>d", "<CMD>Telescope diagnostics bufnr=0<CR>", opts)

			opts.desc = "Show documentation for what is under cursor"
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, opts)

			opts.desc = "[G]oto [D]efinition"
			vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions trim_text=true<cr>", opts)

			opts.desc = "[G]oto [D]eclaration"
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

			opts.desc = "LSP [C]ode [A]ction"
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

			--opts.desc = "[R]e-[N]ame"
			--vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			opts.desc = "[R]eload or start LSP"
			vim.keymap.set("n", "<leader>rl", ":LspRestart | :LspStart<CR>", opts)

			opts.desc = "Goto previous diagnostic"
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

			opts.desc = "Goto next diagnostic"
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		end

		for _, lsp in ipairs(lsp_servers) do
			lspconfig[lsp].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				on_init = function(client)
					-- HACK: to fix some issues with LSP
					-- more details: https://github.com/neovim/neovim/issues/19237#issuecomment-2237037154
					client.offset_encoding = "utf-8"
				end,
			})
		end

		-- nice icons
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e-[N]ame" })
	end,
}
