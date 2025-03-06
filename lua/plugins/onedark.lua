return {
	"navarasu/onedark.nvim",
	config = function()
		require("onedark").setup({
			style = "deep",
			transparent = true,
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
}
