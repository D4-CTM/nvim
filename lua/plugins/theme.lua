return {
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "deep",
				transparent = false,
				code_style = {
					keywords = "bold",
					functions = "bold",
				},
				highlights = {
					["@variable"] = { fg = "$red" },
				},
			})
			require("onedark").load()
		end,
	},
	{
	"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "onedark",
				},
			})
		end,
	}
}
