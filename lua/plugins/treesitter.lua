return     {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        -- Treesitter setup
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "c", "lua", "vim", "julia", "latex", "python", "r", "cpp", "markdown", "markdown_inline" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
