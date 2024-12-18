return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        opts = {
            ensure_installed = {
                "black", -- need manual install
                "mypy",  -- need manual install
            },
            auto_install = true,
        },
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            ensure_installed = {
                "lua_ls", -- Lua
                "html", -- HTML
                "cssls", -- CSS
                "ts_ls", -- JavaScript/TypeScript
                "emmet_ls", -- Emmet for HTML/CSS
                "gopls", -- Go
                "pyright",
                "ruff",
            },
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")

            -- Lua
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }, -- Recognize 'vim' global
                        },
                    },
                },
            })

            -- Python
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })

            -- Go
            lspconfig.gopls.setup({
                capabilities = capabilities,
            })

            -- HTML
            lspconfig.html.setup({
                capabilities = capabilities,
            })

            -- CSS
            lspconfig.cssls.setup({
                capabilities = capabilities,
            })

            -- JavaScript/TypeScript/React
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })

            -- Emmet
            lspconfig.emmet_ls.setup({
                capabilities = capabilities,
                filetypes = {
                    "html", "typescriptreact", "javascriptreact",
                    "css", "sass", "scss", "less", "javascript",
                    "typescript", "markdown"
                },
            })

            -- Keybindings
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
        end,
    },
}
