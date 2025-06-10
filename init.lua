return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "catppuccin", -- Base catppuccin, vim-lumen will handle the specific variant

  -- Dealing with cursor colors and kitty
  vim.api.nvim_command "set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
			-- Never request typescript-language-server for formatting
      filter = function(client) return client.name ~= "tsserver" end,
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      "tsserver"
      -- "pyright"
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Check system theme on startup
    vim.defer_fn(function()
      -- Try to detect system theme using common methods
      local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null || defaults read -g AppleInterfaceStyle 2>/dev/null || echo 'dark'")
      if handle then
        local result = handle:read("*a")
        handle:close()
        
        -- Check if system is in light mode
        if result:match("light") or (not result:match("dark") and not result:match("Dark")) then
          vim.o.background = "light"
          vim.cmd("colorscheme catppuccin-latte")
        else
          vim.o.background = "dark"
          vim.cmd("colorscheme catppuccin-frappe")
        end
      end
    end, 100)
    
    vim.api.nvim_create_autocmd("InsertEnter", {
      desc = "disable paste",
      pattern = "*",
      command = "set nopaste | echo 'nopaste'",
    })

    vim.api.nvim_create_autocmd("InsertLeave", {
      desc = "enable paste",
      pattern = "*",
      command = "set paste | echo 'paste'",
    })

    vim.api.nvim_create_autocmd("InsertEnter", {
      desc = "set yaml options",
      pattern = "*",
      command = "autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab",
    })

    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
    -- local lspconfig = require("lspconfig")
    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    --
    -- lspconfig.tailwindcss.setup({
    --   capabilities = capabilities,
    --   filetypes = { "html", "elixir", "eelixir", "heex" },
    --   init_options = {
    --     userLanguages = {
    --       elixir = "html-eex",
    --       eelixir = "html-eex",
    --       heex = "html-eex",
    --     },
    --   },
    --   settings = {
    --     tailwindCSS = {
    --       experimental = {
    --         classRegex = {
    --           'class[:]\\s*"([^"]*)"',
    --         },
    --       },
    --     },
    --   },
    -- })
    --
    -- lspconfig.emmet_ls.setup({
    --   capabilities = capabilities,
    --   filetypes = { "html", "css", "elixir", "eelixir", "heex" },
    -- }
  end,
}
