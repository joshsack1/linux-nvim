return {
    {
        "scottmckendry/cyberdream.nvim",
        lazy=false,
        priority=1000,
        config=function()
            require("cyberdream").setup({
                -- Some Defaults, some to be changed
                transparent=true,
                saturation=0.85,
                italic_comments=false,
                hide_fillchars=true,
                borderless_pickers=true,
                terminal_colors=true,
                colors={
                    green="#42be65",
                    blue="#0f62fe",
                    cyan="#82cfff",
                }
            })
            vim.cmd("colorscheme cyberdream") -- Set the colorscheme
        end,
    },
    {
        "folke/noice.nvim",
        event="VeryLazy",
        dependencies={
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config=function()
            require("noice").setup({
                vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>") --When WhichKey is installed, add ,{desc = "Dismiss Noice Notifications}
            })
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        config=function()
            require("lualine").setup({
                options={
                    theme="cyberdream",
                },
            })
        end,
    },
}

