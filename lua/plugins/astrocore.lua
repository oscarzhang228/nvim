---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = true, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    mappings = {
      n = {
        ["<Leader>fr"] = {
          function() require("snacks.picker").lsp_references() end,
          nowait = true,
          desc = "Find references",
        },
        ["<Leader>fd"] = { function() require("snacks.picker").files { cmd = "fd" } end, desc = "Find directories" },
        ["<Leader>o"] = {
          [[<CMD>Oil<CR>]],
          desc = "Open Oil in Parent Directory",
        },
        ["<Leader>x"] = {
          "Nop",
          desc = "Trouble / Qflist",
        },
        -- Harpoon
        ["<Leader>h"] = {
          [["<Nop"]],
          desc = "Harpoon",
        },
        ["<Leader>hm"] = {
          [[<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>]],
          desc = "Toggle Harpoon Quick Menu",
        },
        ["<Leader>ha"] = {
          [[<CMD>lua require('harpoon.mark').add_file()<CR>]],
          desc = "Add File to Harpoon",
        },
        ["<Leader>hn"] = {
          [[<CMD>lua require('harpoon.ui').nav_next()<CR>]],
          desc = "Go to next Harpoon mark",
        },
        ["<Leader>hp"] = {
          [[<CMD>lua require('harpoon.ui').nav_prev()<CR>]],
          desc = "Go to previous Harpoon mark",
        },
        -- END Harpoon
        ["n"] = {
          [[nzz]],
        },
        ["N"] = {
          [[Nzz]],
        },
      },

      t = {
        -- terminal escape
        ["<Esc>"] = [[<C-\><C-n>]],
      },
    },
  },
}
