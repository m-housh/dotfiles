-- Plugins

local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'


-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_config(name)
  return string.format("require(\"config/%s\")", name)
end

-- Install packer if not available
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git", "clone", "https://github.com/wbthomason/packer.nvim",
    install_path
  })
  execute "packadd packer.nvim"
end

-- Initialize and configure packer
local packer = require("packer")
packer.init {
  enable = true, -- enable profiling via :PackerCompile profile=true
  threshold = 0 -- the amount in ms that a plugins load time must be over for it to be included in the profile
}
local use = packer.use
packer.reset()

-- actual plugins list
use "wbthomason/packer.nvim"

use {"kyazdani42/nvim-tree.lua", config = get_config("nvim-tree")}

use {
  "nvim-lualine/lualine.nvim",
  config = get_config("lualine"),
  requires = {"kyazdani42/nvim-web-devicons", opt = true}
}

use {
  'nvim-telescope/telescope.nvim',
  config = get_config("telescope"),
  requires = { {'nvim-lua/plenary.nvim'} }
}

use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

use {
  "nvim-treesitter/nvim-treesitter",
  config = get_config("treesitter"),
  run = ":TSUpdate"
}

use "nvim-treesitter/nvim-treesitter-textobjects"

use {
    "hrsh7th/nvim-cmp",
    requires = {
        {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"},
        {"hrsh7th/cmp-cmdline"}, {"hrsh7th/cmp-vsnip"},
        {"f3fora/cmp-spell", {"hrsh7th/cmp-calc"}, {"hrsh7th/cmp-emoji"}}
    },
    config = get_config("cmp")
}

use {"onsails/lspkind-nvim", requires = {{"famiu/bufdelete.nvim"}}}

-- LSP
use {"ray-x/lsp_signature.nvim", requires = {{"neovim/nvim-lspconfig"}}}

use { "williamboman/mason.nvim" }
use { "williamboman/mason-lspconfig.nvim" }
use {
  "neovim/nvim-lspconfig",
  config = get_config("lsp")
}
use {
  "williamboman/nvim-lsp-installer",
  config = get_config("lsp-installer")
}

use {"folke/which-key.nvim", event = "VimEnter", config = get_config("which")}

-- requirement for Neogit
use {
    "sindrets/diffview.nvim",
    cmd = {
        "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles",
        "DiffviewFocusFiles"
    },
    config = get_config("diffview")
}

use {
    "TimUntersberger/neogit",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
    },
    cmd = "Neogit",
    config = get_config("neogit")
}

use {"hrsh7th/vim-vsnip", config = get_config("vsnip")}

use({
    "andrewferrier/wrapping.nvim",
    config = function()
      require("wrapping").setup()
    end,
})

-- Theme
use {
  'EdenEast/nightfox.nvim',
  config = get_config("nightfox")
}
