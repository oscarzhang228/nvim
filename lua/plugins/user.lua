---@type LazySpec
return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    config = function()
      require("oil").setup {
        view_options = {
          show_hidden = false,
          is_hidden_file = function(name, bufnr)
            local m = name:match "^%."
            return m ~= nil
          end,
          natural_order = "fast",
          case_insensitive = false,
          sort = {
            { "type", "asc" },
            { "name", "asc" },
          },
        },
        watch_for_changes = false,
      }
    end,
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
  },

  {
    "ryanmsnyder/toggleterm-manager.nvim",
    dependencies = {
      "akinsho/nvim-toggleterm.lua",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = true,
  },

  {
    "karb94/neoscroll.nvim",
    opts = {},
    config = function()
      require("neoscroll").setup {
        mappings = {
          "<C-u>",
          "<C-d>",
          "<C-b>",
          "<C-f>",
          "<C-y>",
          "<C-e>",
          "zt",
          "zz",
          "zb",
        },
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
        duration_multiplier = 0.25,
        easing = "linear",
        pre_hook = nil,
        post_hook = nil,
        performance_mode = false,
        ignored_events = { "WinScrolled", "CursorMoved" },
      }
    end,
  },
}
