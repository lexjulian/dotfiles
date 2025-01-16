return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>gf", function()
            require("conform").format({
                async = true,
                lsp_fallback = true,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
