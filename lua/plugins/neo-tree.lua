return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set("n", "<leader>b", ":Neotree toggle reveal<CR>", { desc = "Toggle Explorer" })

        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    visible = true, -- show all files/folders by default
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
            },
            default_component_configs = {
                name = {
                    trailing_slash = false,
                    use_git_status_colors = false,
                },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    default = "",
                },
                modified = {
                    symbol = "",
                },
                git_status = {
                    symbols = {},
                },
            },
            window = {
                position = "left",
                width = 30,
            },
        })
    end,
}
