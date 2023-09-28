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

  { "github/copilot.vim", event = "InsertEnter"},

  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      -- include the default astronvim config that calls the setup call
      require "plugins.configs.luasnip"(plugin, opts)
      -- load snippets paths
      require("luasnip.loaders.from_vscode").load {
        -- this can be used if your configuration lives in ~/.config/nvim
        -- if your configuration lives in ~/.config/astronvim, the full path
        -- must be specified in the next line
        paths = { "./lua/user/snippets" }
      }
    end,
  },

  -- {
  --   "elixir-tools/elixir-tools.nvim",
  --   version = "*",
  --   event = { "BufReadPre", "BufNewFile" },
  --   config = function()
  --     local elixir = require("elixir")
  --     local elixirls = require("elixir.elixirls")
  --
  --     elixir.setup {
  --       nextls = {enable = true},
  --       credo = {},
  --       elixirls = {
  --         enable = true,
  --         settings = elixirls.settings {
  --           dialyzerEnabled = false,
  --           enableTestLenses = false,
  --         },
  --         on_attach = function(client, bufnr)
  --           vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
  --           vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
  --           vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
  --         end,
  --       }
  --     }
  --   end,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  -- },

  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup({
  --       suggestion = {
  --         enabled = true,
  --         keymap = {
  --           accept = "<C-l>",
  --           accept_word = false,
  --           accept_line = false,
  --           next = "<C-.>",
  --           prev = "<C-,>",
  --           dismiss = "<C/>",
  --         }
  --       }
  --     })
  --   end,
  -- },

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
  }
}
