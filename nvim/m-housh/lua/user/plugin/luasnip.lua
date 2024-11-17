return {
	"L3MON4D3/LuaSnip",
	opts = {
		history = true,
		enable_autosnippets = false, -- don't automatically expand snippets.
		updatevents = "TextChanged,TextChangedI",
	},
	config = function()
		local ls = require("luasnip")
		local types = require("luasnip.util.types")
		ls.setup({
			extra_opts = {
				[types.choiceNode] = {
					active = {
						virt_text = { { "choiceNode", "Comment" } },
					},
				},
			},
		})
		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/m-housh/lua/user/snippets/" })

		-- Keymaps
		local opts = { silent = true }

		-- Use <Ctrl>k to expand snippets.
		-- This will expand the current item or jump to the next item within the snippet.
		vim.keymap.set({ "i", "s" }, "<C-k>", function()
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			end
		end, opts)

		-- Use <Ctrl>j to jump backwards in a snippet.
		-- This always moves to the previous item within a snippet.
		vim.keymap.set({ "i", "s" }, "<C-j>", function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end, opts)

		-- Reload snippets.
		vim.keymap.set("n", "<leader><leader>s", "<CMD>source ~/.config/m-housh/lua/user/plugin/luasnip.lua<CR>")
	end,
}
