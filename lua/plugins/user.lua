---@type LazySpec
return {
  {
    "karb94/neoscroll.nvim",
    opts = {
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
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {},
  },
  {
    "LunarVim/bigfile.nvim",
    opts = {
      filesize = 2, -- size of the file in MiB, the plugin round file sizes to the closest MiB
      pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
      features = { -- features to disable
        "indent_blankline",
        "illuminate",
        "lsp",
        "treesitter",
        "syntax",
        "matchparen",
        "vimopts",
        "filetype",
      },
    },
  },
}
