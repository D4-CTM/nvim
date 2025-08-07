return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"echasnovski/mini.completion",
		config = function()
			require("mini.completion").setup()

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			vim.lsp.enable({
				"omnisharp",
				"arduino_language_server",
				"lua_ls",
				"clangd",
				"gopls",
				"jdtls",
				"html",
				"zls"
			})

			vim.keymap.set("n", "<leader>lq", "<cmd>LspStopCurrent<CR>")
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
			vim.keymap.set("n", "<leader>F", vim.lsp.buf.format)
			vim.keymap.set("n", "<d", function ()
				vim.diagnostic.jump({ count = -1, float = true, wrap = true })
			end)
			vim.keymap.set("n", ">d", function ()
				vim.diagnostic.jump({ count = 1, float = true, wrap = true })
			end)
			vim.keymap.set("n", "?", vim.lsp.buf.hover)
		end
	},
}
