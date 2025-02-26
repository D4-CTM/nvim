return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {
                "c",
                "cpp",
                "java",
                "javascript",
                "typescript",
                "html",
                "css",
                "go",
                "ruby",
                "sql",
                "zig",
                "lua"
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true},
        })
    end
}
