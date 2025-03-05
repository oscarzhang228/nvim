---@type LazySpec
return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- change colorscheme
      colorscheme = "astrodark",
      -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
      highlights = {
        init = { -- this table overrides highlights in all themes
          -- Normal = { bg = "#000000" },
        },
        astrodark = { -- a table of overrides/changes when applying the astrotheme theme
          -- Normal = { bg = "#000000" },
        },
      },
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
    "racrriga/nvim-notify",
    opts = {
      timeout = 1000,
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup {
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = false,
        },
      }
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local custom_fname = require("lualine.components.filename"):extend()
      local highlight = require "lualine.highlight"
      local default_status_colors = { saved = "#408140", modified = "#800020" }

      function custom_fname:init(options)
        custom_fname.super.init(self, options)
        self.status_colors = {
          saved = highlight.create_component_highlight_group(
            { bg = default_status_colors.saved },
            "filename_status_saved",
            self.options
          ),
          modified = highlight.create_component_highlight_group(
            { bg = default_status_colors.modified },
            "filename_status_modified",
            self.options
          ),
        }
        if self.options.color == nil then self.options.color = "" end
      end

      function custom_fname:update_status()
        local data = custom_fname.super.update_status(self)
        data = highlight.component_format_highlight(
          vim.bo.modified and self.status_colors.modified or self.status_colors.saved
        ) .. data
        return data
      end

      require("lualine").setup {
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { custom_fname },
          lualine_x = { "progress" },
          lualine_y = {},
          lualine_z = {},
        },
      }
    end,
    opts = {
      theme = "dracula",
    },
  },
}
