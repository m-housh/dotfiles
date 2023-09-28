-- This file contains plugin's that don't require much configuration.
return {
  {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    build = "make install_jsregexp",
    config = function()
      local luasnip = require('luasnip')
      local types = require('luasnip.util.types')
      luasnip.config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
        ext_opts = {
          [types.choiceNode] = {
            active = {
              virt_text = { { "<-", "Error" } },
            },
          },
        },
      }
    end
  },
  {
      'EdenEast/nightfox.nvim',
      lazy = false, -- make sure we load this during startup
      priority = 1000, -- make sure to load this before all other plugins.
      opts = {
        fox = "terafox", -- change the colorscheme to use terafox
        styles = {
          comments = "italic", -- change style of comments to be italic
          keywords = "bold", -- change style of keywords to be bold
          functions = "italic,bold" -- styles can be a comma separated list
        },
        inverse = {
          match_paren = true, -- inverse the highlighting of match_parens
        },
        colors = {
          red = "#FF000", -- Override the red color for MAX POWER
          --bg_alt = "#000000",
        },
        hlgroups = {
          TSPunctDelimiter = { fg = "${red}" }, -- Override a highlight group with the color red
          LspCodeLens = { bg = "#000000", style = "italic" },
        }

      },
      config = function()
        require('nightfox').load()
        vim.cmd("colorscheme terafox")
      end
  },
  {
	  "hrsh7th/vim-vsnip",
	  config = function()
      vim.g.vsnip_snippet_dir = os.getenv('HOME') .. '/.config/m-housh/lua/snippets/'
    end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    enable = true,
    opts = {
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    opts = {
      close_if_last_window = false,
      enable_git_status = true,
      enable_diagnostics = true,
      filesystem = {
        filtered_items = {
          hide_dotfiles = false
        },
        use_libuv_file_watcher = true
      },
    }
  },
  {
    'm-housh/swift.nvim',
    dependencies = {
      'akinsho/toggleterm.nvim'
    },
    config = function()
      require('swift').setup()
      local default_options = { noremap = true, silent = true }
      local actions = require('swift.actions')

      vim.keymap.set('n', '<c-b>', actions.build, default_options)
      vim.keymap.set('n', '<c-u>', actions.test, default_options)
    end
  },
  {
    "andrewferrier/wrapping.nvim",
    opts = {
      auto_set_mode_filetype_allowlist = {
        "asciidoc",
        "gitcommit",
        "latex",
        "markdown",
        "tex",
        "text"
      },
    },
    config = function()
      require("wrapping").setup({
        softener = {
          markdown = 1.3
        },
      })
    end
  },
}
