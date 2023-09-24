-- This file contains plugin's that don't require much configuration.
return {
  {
	  "hrsh7th/vim-vsnip",
	  config = function()
      vim.g.vsnip_snippet_dir = os.getenv('HOME') .. '/.config/nvim/snippets/'
    end
  },
--   {
--     dir = "~/LocalProjects/plugins/m-housh/swift.nvim"
--   }
}
