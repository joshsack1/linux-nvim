return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<C-Space>', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>f', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
            vim.keymap.set("n", "<leader>fw", function ()
                local word = vim.fn.expand("<cword>")
                builtin.grep_string({ search = word })
            end, {desc = "Find word"})
            vim.keymap.set("n", "<leader>fW", function ()
                local word = vim.fn.expand("<cWORD>")
                builtin.grep_string({ search = word })
            end, {desc = "find Word"})
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                            -- even more opts
                        }

                    }
                }
            }
            -- To get ui-select loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require("telescope").load_extension("ui-select")
        end,
    },
}
