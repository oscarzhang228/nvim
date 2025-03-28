---@type LazySpec
return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      colorscheme = "catppuccin-mocha",
      -- Icons can be configured throughout the interface
      icons = {
        -- configure the loading of the lsp in the status line
        LSPLoading1 = "⠋",
        LSPLoading2 = "⠙",
        LSPLoading3 = "⠹",
        LSPLoading4 = "⠸",
        LSPLoading5 = "⠼",
        LSPLoading6 = "⠴",
        LSPLoading7 = "⠦",
        LSPLoading8 = "⠧",
        LSPLoading9 = "⠇",
        LSPLoading10 = "⠏",
      },
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      theme = "auto",
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "filename" },
        lualine_x = { "progress" },
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
  {
    "echasnovski/mini.icons",
    opts = {},
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      styles = {
        comments = { "italic" },
        functions = { "bold" },
        keywords = { "italic" },
        operators = { "bold" },
        conditionals = { "bold" },
        loops = { "bold" },
        booleans = { "bold", "italic" },
        numbers = {},
        types = {},
        strings = {},
        variables = {},
        properties = {},
      },
      highlight_overrides = {
        ---@param cp palette
        all = function(cp)
          return {
            LineNr = { fg = cp.blue },
            -- for directories in picker
            NonText = { fg = cp.overlay2 },
          }
        end,
      },
      transparent_background = true,
      term_colors = true,
    },
  },
  {
    "xiyaowong/transparent.nvim",
    opts = function()
      local transparent = require "transparent"
      transparent.clear_prefix "heirline"
      transparent.clear_prefix "lualine"
    end,
  },
}
