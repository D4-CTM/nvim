return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    config = function()
        vim.keymap.set('n', '<leader>b', ':Neotree toggle<CR>', { desc = 'Toggle Neotree' })
        require('neo-tree').setup({
            close_if_last_window = true, -- Close if Neotree is the last window
            filesystem = {
                filtered_items = {
                    visible = true, -- Show hidden files by default
                },
            },
        })
    end,
}
