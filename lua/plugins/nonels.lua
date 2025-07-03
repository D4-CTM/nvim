return {
	"nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.rubocop,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.diagnostics.rubocop,
                null_ls.builtins.diagnostics.spectral.with({
                    args = { "--format", "json", "--stdin" },
                }),
            },
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
