return  {
      'EdenEast/nightfox.nvim',
      lazy = false, -- make sure we load this during startup
      priority = 1000, -- make sure to load this before all other plugins.
      opts = {
        --fox = "terafox", -- change the colorscheme to use terafox
        styles = {
          comments = "italic", -- change style of comments to be italic
          keywords = "bold", -- change style of keywords to be bold
          functions = "italic,bold" -- styles can be a comma separated list
        },
        inverse = {
          match_paren = true, -- inverse the highlighting of match_parens
        },
        colors = {
          red = "#FF0000", -- Override the red color for MAX POWER
          --bg_alt = "#000000",
        },
        hlgroups = {
          TSPunctDelimiter = { fg = "${red}" }, -- Override a highlight group with the color red
          LspCodeLens = { bg = "#000000", style = "italic" },
        }
      },
  }
