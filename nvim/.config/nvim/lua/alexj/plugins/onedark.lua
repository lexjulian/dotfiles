return {
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            local onedark = require('onedark')

            onedark.setup({
                style = 'cool',
                transparent = true,
                term_colors = false,
                ending_tildes = false,
                cmp_itemkind_reverse = false,

                toggle_style_key = '<leader>o1',
                toggle_style_list = { 'dark', 'darker', 'cool', 'warm', 'warmer', 'deep', 'light' },

                -- Options are italic, bold, underline, none and combos 'italic,bold'
                code_style = {
                    comments = 'italic',
                    keywords = 'none',
                    functions = 'none',
                    strings = 'none',
                    variables = 'none',
                },

                -- lualine = { transparent = true },
                diagnostics = { darker = true, undercurl = true, background = false },
            })

            onedark.load()
        end
    },
}
