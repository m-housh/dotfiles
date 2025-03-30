-- This needs some work, as it's not working. May need to install a different browser??
return {
	"iamcco/markdown-preview.nvim",
	enabled = false,
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	config = function()
		return {
			mkdp_browser = "Vivaldi",
		}
	end,
	keys = {
		{
			"<leader>mp",
			ft = "markdown",
			"<cmd>MarkdownPreviewToggle<cr>",
			desc = "Markdown Preview",
		},
	},
	build = "cd app && yarn install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
}
