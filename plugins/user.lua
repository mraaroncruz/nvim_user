return { -- You can also add new plugins here as well:
-- Add plugins, the lazy syntax
-- "andweeb/presence.nvim",
-- {
--   "ray-x/lsp_signature.nvim",
--   event = "BufRead",
--   config = function()
--     require("lsp_signature").setup()
--   end,
-- },
{
    "tpope/vim-fugitive",
    event = "VeryLazy"
}, {
    "mg979/vim-visual-multi",
    event = "VeryLazy"
}, -- { -- override nvim-cmp plugin
--   "hrsh7th/nvim-cmp",
--   -- override the options table that is used in the `require("cmp").setup()` call
--   opts = function(_, opts)
--     -- opts parameter is the default options table
--     -- the function is lazy loaded so cmp is able to be required
--     local cmp = require "cmp"
--     -- modify the mapping part of the table
--     opts.mapping["<C-p>"] = cmp.complete()
--
--     opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
--       fallback()
--     end, {"i", "s"})
--
--     -- return the new table to be used
--     return opts
--   end,
-- },
-- {
--   "github/copilot.vim",
--   event = "InsertEnter",
--   on_attach = function(_, _)
--     vim.keymap.set("i", "<C-i>", 'copilot#Accept("<CR>")', { buffer = true, noremap = true })
--   end,
-- },
{
    "github/copilot.vim",
    lazy = false,
    config = function()
        -- Mapping tab is already used by NvChad
        vim.g.copilot_no_tab_map = true;
        vim.g.copilot_assume_mapped = true;
        vim.g.copilot_tab_fallback = "";
        -- The mapping is set to other key, see custom/lua/mappings
        -- or run <leader>ch to see copilot mapping section
    end
}, {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
        -- include the default astronvim config that calls the setup call
        require "plugins.configs.luasnip"(plugin, opts)
        -- load snippets paths
        require("luasnip.loaders.from_vscode").load {
            -- this can be used if your configuration lives in ~/.config/nvim
            -- if your configuration lives in ~/.config/astronvim, the full path
            -- must be specified in the next line
            paths = {"./lua/user/snippets"}
        }
    end
}, {
    "tveskag/nvim-blame-line",
    event = "VeryLazy",
    keys = {{
        "<leader>B",
        ":ToggleBlameLine<CR>",
        desc = "Toggle BlameLine"
    }}
}, -- {
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
{
    "windwp/nvim-ts-autotag",
    autotag = {
        enable = true
    }
}, {
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup({
            background_colour = "#1e1e2e" -- adjust to your theme
            -- or use:
            -- background_colour = require("astronvim.utils").get_hlgroup("Normal", true).bg,
        })
    end
}, {
    "rose-pine/neovim",
    as = "rose-pine",
    -- config = function() vim.cmd "colorscheme rose-pine" end,
    event = "VeryLazy"
}, {
    "folke/tokyonight.nvim",
    lazy = false,
    as = "tokyonight",
    config = function()
        -- vim.cmd "colorscheme tokyonight" -- Commented out for vim-lumen
    end
}, {
    "vimpostor/vim-lumen",
    lazy = false,
    priority = 1001, -- Higher than catppuccin
    dependencies = {"catppuccin/nvim"}, -- Ensure Catppuccin loads first
    config = function()
        vim.g.lumen_light_colorscheme = "catppuccin-latte"
        vim.g.lumen_dark_colorscheme = "catppuccin-frappe"
    end
}, {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    event = "VeryLazy",
    opts = {
        flavour = "frappe"
    },
    config = function()
        vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
        require("catppuccin").setup {
            background = {
                light = "latte",
                dark = "frappe"
            },
            -- transparent_background = true,
            term_colors = true
            -- styles = {
            --   comments = { "italic" },
            --   functions = { "italic" },
            --   keywords = { "italic" },
            --   variables = { "italic" },
            -- },
        }
        -- vim.cmd [[colorscheme catppuccin]] -- Commented out for vim-lumen
    end
}, {
    "drewtempelmeyer/palenight.vim",
    as = "palenight",
    config = function()
        -- vim.cmd "colorscheme palenight" -- Commented out for vim-lumen
    end
}}
