return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.servers = opts.servers or {}
    opts.servers.tsserver = {}
  end,
}
