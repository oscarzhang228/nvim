--- @type LazySpec

return { -- override nvim-cmp plugin
  {
    "hrsh7th/nvim-cmp",
    -- override the options table that is used in the `require("cmp").setup()` call
    opts = function(_, opts)
      -- opts parameter is the default options table
      -- the function is lazy loaded so cmp is able to be required
      local cmp = require "cmp"
      -- modify the mapping part of the table
      opts.mapping["<C-x>"] = cmp.mapping.select_next_item()
      opts.sources = cmp.config.sources {
        { name = "copilot", priority = 1000 },
        { name = "nvim_lsp", priority = 900 },
        { name = "luasnip", priority = 750 },
        {
          name = "buffer",
          priority = 500,
          option = {
            get_bufnrs = function() return vim.api.nvim_list_bufs() end,
          },
        },
        { name = "path", priority = 250 },
      }

      opts.formatting.format = require("astrocore").patch_func(opts.formatting.format, function(orig, entry, vim_item)
        local format_vim = orig(entry, vim_item)
        format_vim.menu = ({
          nvim_lsp = "[LSP]",
          buffer = "[Buffer]",
          path = "[Path]",
          luasnip = "[LuaSnip]",
          copilot = "[Copilot]",
        })[entry.source.name]
        return format_vim
      end)
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
      }
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function() require("copilot_cmp").setup() end,
  },
}
