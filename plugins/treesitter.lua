return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    {
      "windwp/nvim-ts-autotag",
      opts = {
        enable_close_on_slash = false,
      },
    },
  },
  opts = {
    ensure_installed = {
      "astro",
      "bash",
      "css",
      "elixir",
      "eex",
      "heex",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "prisma",
      "query",
      "regex",
      "ruby",
      "scss",
      "sql",
      "svelte",
      "tsx",
      "typescript",
      "vim",
      "yaml",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    -- Remove the deprecated autotag config
    autotag = nil,
  },
}
