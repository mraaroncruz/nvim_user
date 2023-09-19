-- return {
--   "nvim-treesitter/nvim-treesitter",
--   opts = function(_, opts)
--     -- add more things to the ensure_installed table protecting against community packs modifying it
--     opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
--       "bash",
--       "css",
--       "elixir",
--       "heex",
--       "html",
--       "javascript",
--       "json",
--       "lua",
--       "markdown",
--       "markdown_inline",
--       "prisma",
--       "query",
--       "regex",
--       "ruby",
--       "scss",
--       "sql",
--       "svelte",
--       "tsx",
--       "typescript",
--       "vim",
--       "yaml",
--     })
--   end,
-- }
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash",
      "css",
      "elixir",
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
  },
}
