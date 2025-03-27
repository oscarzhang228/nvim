---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      ensure_installed = {
        -- install language servers
        "lua-language-server",

        "typescript-language-server",
        "html-lsp",
        "emmet-language-server",
        "eslint-lsp",

        "jdtls",

        -- install formatters
        "stylua",

        -- install debuggers
        "debugpy",
        "js-debug-adapter",
        "java-debug-adapter",

        -- install any other package
      },
    },
  },
}
