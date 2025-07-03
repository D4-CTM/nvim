return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "mfussenegger/nvim-jdtls"
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            --    require("mason-lspconfig").setup({
            -- automatic_installation = true,
            --   })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.clangd.setup({ capabilities = capabilities })
            lspconfig.css_variables.setup({ capabilities = capabilities })
            lspconfig.omnisharp.setup({
                cmd = {
                    "dotnet",
                    vim.fn.expand("~/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll")
                },
                capabilities = capabilities
            })
            lspconfig.gopls.setup({ capabilities = capabilities })
            lspconfig.html.setup({ capabilities = capabilities })
            lspconfig.jdtls.setup({ capabilities = capabilities })
            lspconfig.sqls.setup({ capabilities = capabilities })
            lspconfig.ts_ls.setup({ capabilities = capabilities })
            lspconfig.pylsp.setup({ capabilities = capabilities })
            lspconfig.zls.setup({
                capabilities = capabilities,
                on_attach = function(client, _)
                    client.server_capabilities.semanticTokensProvider = nil
                end
            })

            lspconfig.spectral.setup({
              filetypes = { "yaml", "json" },
              settings = {
                spectral = {
                  run = "onType",
                  ruleset = {
                    extend = {"spectral:oas"},
                  },
                },
              },
            })

            lspconfig.angularls.setup({
                cmd = {
                    "ngserver",
                    "--stdio",
                    "--tsProbeLocations",
                    vim.fn.getcwd(),
                    "--ngProbeLocations",
                    vim.fn.getcwd(),
                },
                on_new_config = function(new_config, _)
                    new_config.cmd = {
                        "ngserver",
                        "--stdio",
                        "--tsProbeLocations",
                        vim.fn.getcwd(),
                        "--ngProbeLocations",
                        vim.fn.getcwd(),
                    }
                end,
                filetypes = { "typescript", "html" },
                root_dir = lspconfig.util.root_pattern("angular.json", "project.json"),
                capabilities = capabilities,
            })

            vim.diagnostic.config({
                virtual_text = true,      -- show inline errors
                signs = true,             -- show signs in the gutter
                underline = true,         -- underline problem areas
                update_in_insert = false, -- don't update while typing
                severity_sort = true,     -- sort by severity
            })

            vim.keymap.set("n", "?", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n" }, "<leader>,", vim.lsp.buf.code_action, {})
        end,
    },
}
