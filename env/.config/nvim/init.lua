-- NOTE: This requires neovim >= 0.12, you can use bob to download nightly.
--
vim.g.netrw_browsex_viewer = "xdg-open"
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.winborder = "rounded"
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.showtabline = 2
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.termguicolors = true

vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/mason-org/mason.nvim" },
})

require("mason").setup()
require("mini.pick").setup()
require("oil").setup()

-- Set color scheme
vim.cmd([[colorscheme catppuccin-mocha]])
vim.cmd(":hi statusline guibg=NONE")
vim.cmd [[set completeopt+=menuone,noselect,popup]]

-- LSP
vim.lsp.enable({
	"lua_ls", "tinymist", "marksman", "bashls", "hyprls",
})

vim.lsp.config('bashls', {
	filetypes = { "bash", "sh", "zsh" },
	cmd = { 'bash-language-server', 'start' },
})

-- Fix warnings for 'vim' global keyword.
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = {
					vim.api.nvim_get_runtime_file("", true),
				},
			},
		},
	},
})

-- Keymaps
local map = vim.keymap.set

map('n', '<leader>e', ':Oil<CR>')
map('n', '<leader>f', ':Pick files tool="git"<CR>')
map('n', '<leader>h', ':Pick help<CR>')
map('n', '<leader>lf', vim.lsp.buf.format)
map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>q', ':quit<CR>')
map('n', '<leader>w', ':write<CR>')

-- Auto commands.
local defaultopts = { clear = true }

-- Force zsh files to use bash syntax highlighting
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = vim.api.nvim_create_augroup('my.zsh', defaultopts),
	pattern = "*",
	callback = function(args)
		local first_line = vim.api.nvim_buf_get_lines(args.buf, 0, 1, false)[1] or ""
		if first_line:match("^#!.*zsh") then
			vim.bo[args.buf].filetype = "bash"
		end
	end,
})

-- Markdown
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.md",
	group = vim.api.nvim_create_augroup('my.markdown', defaultopts),
	callback = function(_)
		-- HACK: Set filetype to markdown for '.md' files.
		-- Not sure why it doesn't detect these as markdown files, but this fixes the issue.
		vim.cmd.setlocal("filetype=markdown")
		vim.cmd.setlocal("textwidth=120")
		vim.cmd.setlocal("spell spelllang=en_us")
	end,
})

-- Neomutt
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "neomutt*",
	group = vim.api.nvim_create_augroup('my.neomutt', defaultopts),
	callback = function(_)
		-- HACK: Set filetype to markdown for '.md' files.
		-- Not sure why it doesn't detect these as markdown files, but this fixes the issue.
		vim.cmd.setlocal("filetype=markdown")
		vim.cmd.setlocal("textwidth=120")
		vim.cmd.setlocal("spell spelllang=en_us")
	end,
})

-- GoPass
vim.api.nvim_exec2(
	[[
  autocmd BufNewFile,BufRead /private/**/gopass** setlocal noswapfile nobackup noundofile shada=""
  ]],
	{}
)

-- Stolen from: https://github.com/SylvanFranklin/.config/blob/main/nvim/init.lua
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method('textDocument/completion') then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})

-- Hyprlang LSP
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
	pattern = { "*.hl", "hypr*.conf" },
	callback = function(event)
		vim.lsp.start {
			name = "hyprlang",
			cmd = { "hyprls" },
			root_dir = vim.fn.getcwd(),
		}
	end
})
