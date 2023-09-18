return {

  -- Theme
  {
    'EdenEast/nightfox.nvim',
    lazy = false, -- make sure we load this during startup
    priority = 1000, -- make sure to load this before all other plugins.
    config = function()
      -- load the colorscheme
      vim.cmd([[colorscheme nightfox]])
    end,
    --config = get_config("nightfox")
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      -- "nvim-tree/web-dev-icons"
    },
    config = function()
	    --require('lau
	end,
  },

  { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },

  {
    "nvim-treesitter/nvim-treesitter",
    -- config = get_config("treesitter"),
    -- run = ":TSUpdate"
  },

  "nvim-treesitter/nvim-treesitter-textobjects",


  -- LSP
  {
    "onsails/lspkind-nvim",
    dependencies = {
      "famiu/bufdelete.nvim"
    }
  },
  {
    "ray-x/lsp_signature.nvim",
    dependencies = {
      "neovim/nvim-lspconfig"
    }
  },

  { "williamboman/mason.nvim" },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
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
      })
    end
  },

  -- requirement for Neogit
  {
    "sindrets/diffview.nvim",
    cmd = {
        "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles",
        "DiffviewFocusFiles"
    },
    --config = get_config("diffview")
  },

  {
    "TimUntersberger/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
    },
    cmd = "Neogit",
    --config = get_config("neogit")
  },

  {
	  "hrsh7th/vim-vsnip",
	  --config = get_config("vsnip")
  },

-- use({
--     "andrewferrier/wrapping.nvim",
--     config = function()
--       require("wrapping").setup()
--     end,
-- })

}
