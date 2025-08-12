return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "OXY2DEV/markview.nvim" },
	build = ":TSUpdate",
	lazy = false,
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
			highlight = { enable = false },
			indent = { enable = true },
			auto_install = true,
			ignore_install = {},
			modules = {},
		})
	end,
}
