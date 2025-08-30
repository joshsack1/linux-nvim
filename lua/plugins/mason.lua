return {
    -- {
    --     "mason-org/mason.nvim",
    --     -- lazy=false,
    --     -- config=function()
    --     --     require("mason").setup({
    --     --     })
    --     -- end,
    --     opts={
    --         ui = {
    --             icons = {
    --                 package_installed = "✓",
    --                 package_pending = "➜",
    --                 package_uninstalled = "✗"
    --             }
    --         },
    --     }
    -- },
    -- {
    --     "mason-org/mason-lspconfig.nvim",
    --     opts = {
    --         ensure_installed={"lua_ls", "texlab", "marksman",},
    --     },
    --     dependencies = {
    --         "neovim/nvim-lspconfig",
    --     },
    -- },
    {
        "neovim/nvim-lspconfig",
        config=function()
            vim.lsp.enable({
                'julials',
                'clangd',
                'texlab',
                'r_language_server',
                'marksman'
            })
            vim.lsp.config('lua_ls', {
                on_init = function(client)
                    if client.workspace_folders then
                        local path = client.workspace_folders[1].name
                        if
                            path ~= vim.fn.stdpath('config')
                            and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                        then
                            return
                        end
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                        runtime = {
                            -- Tell the language server which version of Lua you're using (most
                            -- likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT',
                            -- Tell the language server how to find Lua modules same way as Neovim
                            -- (see `:h lua-module-load`)
                            path = {
                                'lua/?.lua',
                                'lua/?/init.lua',
                            },
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME
                                -- Depending on the usage, you might want to add additional paths
                                -- here.
                                -- '${3rd}/luv/library'
                                -- '${3rd}/busted/library'
                            }
                            -- Or pull in all of 'runtimepath'.
                            -- NOTE: this is a lot slower and will cause issues when working on
                            -- your own configuration.
                            -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                            -- library = {
                            --   vim.api.nvim_get_runtime_file('', true),
                            -- }
                        }
                    })
                end,
                settings = {
                    Lua = {}
                }
            })
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "<leader><space>", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<leader>f", function()
                        vim.lsp.buf.format({ timeout_ms = 10000 })
                    end)

                    vim.keymap.set("n", "<leader>d", function()
                        vim.diagnostic.open_float({
                            border = "rounded",
                        })
                    end, opts)
                end,
            })
        end,
    },
}
