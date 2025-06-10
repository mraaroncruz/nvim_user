return {
  "NMAC427/guess-indent.nvim",
  opts = {},
  config = function(_, opts)
    require("guess-indent").setup(opts)
    
    -- Fix the buffer error by using autocmd properly
    vim.api.nvim_create_autocmd("BufReadPost", {
      pattern = "*",
      callback = function()
        require("guess-indent").set_from_buffer(0) -- 0 = current buffer
      end,
    })
  end,
}
