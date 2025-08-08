return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gu", function()
				vim.ui.input({ prompt = "Commit message" }, function(message)
					if (message == nil or message == "") then
						print("Commit message is null")
						return
					end

					vim.cmd("Git add .")
					vim.cmd(string.format("Git commit -m \"%s\"", message))
					vim.cmd("Git push")
				end)
			end, { desc = "Git commit + push function" })

			vim.keymap.set("n", "<leader>gc", function()
				vim.ui.input({ prompt = "Commit message" }, function(message)
					if (message == nil or message == "") then
						print("Commit message is null")
						return
					end

					vim.cmd("Git add .")
					vim.cmd(string.format("Git commit -m \"%s\"", message))
				end)
			end, { desc = "Git commit function" })

			vim.keymap.set("n", "<leader>gp", ":Git push<CR>", {})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>zh", ":Gitsigns reset_hunk<CR>", {})
			vim.keymap.set("n", "<leader>rh", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>vh", ":Gitsigns preview_hunk_inline<CR>", {})
		end,
	},
}
