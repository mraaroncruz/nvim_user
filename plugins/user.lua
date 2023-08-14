return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  { "tpope/vim-fugitive", event = "VeryLazy" },

  { "mg979/vim-visual-multi", event = "VeryLazy" },

  { "windwp/nvim-ts-autotag",
    autotag = {
      enable = true
    }
  },

  {
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end,
    event = "VeryLazy"
  },

  { "folke/tokyonight.nvim", 
    lazy = false,
    as = "tokyonight",
    config = function()
      vim.cmd("colorscheme tokyonight")
    end
  },

  {
    "drewtempelmeyer/palenight.vim",
    as = "palenight",
    config = function()
      vim.cmd("colorscheme palenight")
    end
  },

  "github/copilot.vim"
}
