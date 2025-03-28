---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.utility.noice-nvim" },

  -- language packs
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.python" },

  -- import/override with your plugins folder
}
