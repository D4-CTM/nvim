return {
  {
    "tpope/vim-fugitive",
    config = function ()
      vim.keymap.set("n", "<leader>ga", ":Git add .<CR>", {})
      vim.keymap.set("n", "<leader>gc", ":Git blame<CR>", {})
      vim.keymap.set("n", "<leader>gp", ":Git push<CR>", {})
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      vim.keymap.set("n", "<leader>rh", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
    end,
  }
}
