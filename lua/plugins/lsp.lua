return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		config = function()
			local ls = require("luasnip")

			vim.keymap.set({ "i", "s" }, "<Tab>", function()
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				else
					vim.api.nvim_feedkeys("\t", "n", false)
				end
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end, { silent = true })
		end
	},
	{
		"echasnovski/mini.completion",
		config = function()
			require('mini.completion').setup()

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			vim.lsp.enable({
				"spectral_language_server",
				"arduino_language_server",
				"omnisharp",
				"lemminx",
				"lua_ls",
				"clangd",
				"gopls",
				"jdtls",
				"html",
				"sqls",
				"zls"
			})

			vim.keymap.set("n", "<leader>lq", function()
				local clients = vim.lsp.get_clients()
				if clients == nil or #clients == 0 then
					print("No active lsp found")
					return
				end;

				vim.ui.select(clients, {
					prompt = "Stop client:",
					format_item = function(item)
						return item.name
					end
				}, function(item)
					if item == nil then return end

					vim.lsp.stop_client(item.id)
					print(item.name .. " stopped")
				end)
			end)

			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
			vim.keymap.set("n", "<leader>F", vim.lsp.buf.format)
			vim.keymap.set("n", "<d", function()
				vim.diagnostic.jump({ count = -1, float = true, wrap = true })
			end)
			vim.keymap.set("n", ">d", function()
				vim.diagnostic.jump({ count = 1, float = true, wrap = true })
			end)
			vim.keymap.set("n", "?", vim.lsp.buf.hover)
		end
	},
}
