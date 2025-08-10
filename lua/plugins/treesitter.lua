return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			sync_install = false,
			ensure_installed = {
				"cpp",
				"java",
				"javascript",
				"typescript",
				"c_sharp",
				"go",
				"zig",
				"lua",
			},
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = true,
			ignore_install = {},
			modules = {},
		})

		vim.keymap.set("n", "F", function()
			local savedCursor = vim.api.nvim_win_get_cursor(0)
			vim.cmd("normal! gg")
			vim.cmd("normal! =G")
			vim.api.nvim_win_set_cursor(0, savedCursor)
		end)
	end,
}
