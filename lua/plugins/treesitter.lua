---@type LazySpec

return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "python",
      "typescript",
      "javascript",
      "cpp",
      "java",
      "regex",
    },
    highlight = {
      enable = true,
    },
  },
}
