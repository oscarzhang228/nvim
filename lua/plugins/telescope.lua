--- @type LazySpec

return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    config = function()
      require("telescope").setup {
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
        },
      }
      -- To get fzf loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension "fzf"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.telescope"(plugin, opts)
      local telescope = require "telescope"
      telescope.setup {
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      }
    end,
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
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      view_options = {
        show_hidden = true,
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
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
  },
}
