return {
    -- Install and manage lsp servers and external tooling using mason and mason lsp.
    -- Mason is a package manager for automatically installing and integrating external tools
    {
        "https://github.com/williamboman/mason.nvim.git",
        opts = {}
    },

    -- Mason tool install we can use to pull in linters and formatters
    {

        "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim.git",
        opts = {
            ensure_installed = {
                "prettier",
                "isort",
                "black",
                "pylint",
                "stylua",
                "google-java-format",
                "shellcheck",
                "shfmt"
            }
        }

    },

    -- Mason specific lsp config. Here's where we automatically install our lsps
    {
        "https://github.com/williamboman/mason-lspconfig.nvim",
        opts = {
            automatic_installation = true,
            ensure_installed = {
                "bashls",
                "dockerls",
                "jdtls",
                "jsonls",
                "lua_ls",
                "marksman",
                "pyright",
                "sqlls"
            }
        }
    },

    {
        "https://github.com/neovim/nvim-lspconfig.git",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "https://github.com/hrsh7th/cmp-nvim-lsp.git",
            { "https://github.com/folke/lazydev.nvim.git", opts = {} },
        },

        config = function()
            local nvim_lsp = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")

            local on_attach = function(client, bufnr)
                -- format on save
                if client.server_capabilities.documentFormattingProvider then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = vim.api.nvim_create_augroup("Format", { clear = true }),
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format()
                        end,
                    })
                end
            end

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Set up lsp configuration
            -- Language server for nvim lua
            nvim_lsp.lua_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                on_init = function(client)
                    if client.workspace_folders then
                        local path = client.workspace_folders[1].name
                        if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                            return
                        end
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT'
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME
                                -- Depending on the usage, you might want to add additional paths here.
                                -- "${3rd}/luv/library"
                                -- "${3rd}/busted/library",
                            }
                            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                            -- library = vim.api.nvim_get_runtime_file("", true)
                        }
                    })
                end,
                settings = {
                    Lua = {}
                }
            })

            -- Eclipse java language server
            nvim_lsp.jdtls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                cmd = { "jdtls" }
            })

            -- Python language server config
            nvim_lsp.pyright.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- Bash language server
            nvim_lsp.bashls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- Docker language server
            nvim_lsp.dockerls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- Json language server
            nvim_lsp.jsonls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- Markdown language server
            nvim_lsp.marksman.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- Sql language server
            nvim_lsp.sqlls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- This is required for nvim lua to work. Not sure why, aught to read the docs!
            mason_lspconfig.setup_handlers({
                function(server)
                    nvim_lsp[server].setup({
                        capabilities = capabilities,
                    })
                end,
            })
        end,
    }
}
