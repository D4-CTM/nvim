return {
	{
		"junegunn/fzf.vim"
	},
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		config = function()
			local fzf = require("fzf-lua")

			vim.keymap.set("n", "<leader>lg", function()
				vim.ui.input({ prompt = "Input file pattern: " }, function(input)
					if input == nil or input == "" then
						vim.notify("File extension was empty", "error")
						return
					end

					fzf.live_grep({
						rg_opts = string.format("--glob %s", input)
					})
				end)
			end)
			vim.keymap.set("n", "<leader>ge", ":FzfLua diagnostics_workspace<CR>")
			vim.keymap.set("n", "<leader>fg", ":FzfLua live_grep<CR>")
			vim.keymap.set("n", "<leader>fc", ":FzfLua git_diff<CR>")
			vim.keymap.set("n", "<leader>fh", ":FzfLua git_hunks<CR>")
			vim.keymap.set("n", "<leader>fb", ":FzfLua buffers<CR>")
			vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>")
		end
	}
}
