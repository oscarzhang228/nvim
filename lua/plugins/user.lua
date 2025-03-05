---@type LazySpec
return {
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
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
}
