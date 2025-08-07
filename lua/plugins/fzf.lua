return {
	{
		"junegunn/fzf.vim"
	},
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		config = function()
			vim.keymap.set("n", "<leader>lg", ":FzfLua live_grep<CR>")
			vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>")
			vim.keymap.set("n", "<leader>fg", ":FzfLua grep<CR>")
		end
	}
}
