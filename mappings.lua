-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<M-Left>"] = {function() require('smart-splits').resize_left() end, desc = "Resize left"},
    ["<M-Down>"] = {function() require('smart-splits').resize_down() end, desc = "Resize down"},
    ["<M-Up>"] = {function() require('smart-splits').resize_up() end, desc = "Resize up"},
    ["<M-Right>"] = {function() require('smart-splits').resize_right() end, desc = "Resize right"},
    ["<C-q>"] = false,
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>tt"] = { ":TermExec size=80 direction=vertical cmd=\"mix-test-watch %\"<CR>", desc = "Test watch current file"},
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<C-p>"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" },
    ["<C-y>"] = { function() require("telescope.builtin").live_grep() end, desc = "Find words" },
    [",,"] = { "<C-^>" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
		["<C-q>"] = { function() require("notify").dismiss({ silent = true }) end, desc = "Dismiss notification" },
    ["<C-l>"] = {
      function()
        vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
      end,
      desc="Copilot Accept",
      replace_keycodes = true,
      nowait=true,
      silent=true,
      expr=true,
      noremap=true
    }
  },
  i = {
    ["<C-l>"] = {
      function()
        vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
      end,
      desc="Copilot Accept",
      replace_keycodes = true,
      nowait=true,
      silent=true,
      expr=true,
      noremap=true
    }
  }
}
