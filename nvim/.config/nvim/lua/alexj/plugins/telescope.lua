return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-c>"] = actions.close,
                        ["<esc>"] = actions.close,
                    },
                    n = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        ["<C-c>"] = actions.close,
                        ["<esc>"] = actions.close,
                    },

                },
            },
        })

        -- set keymaps
        local keymap = vim.keymap

        keymap.set("n", "<leader>fa", builtin.find_files, { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Fuzzy find in files" })
        keymap.set("n", "<leader>ff", builtin.git_files, { desc = "Search in git files" })
        keymap.set("n", "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
    end,
}
