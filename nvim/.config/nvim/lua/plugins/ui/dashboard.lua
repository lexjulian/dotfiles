local dashboard = require('dashboard')
local icons = require('lib.icons')

dashboard.setup({
    theme = 'hyper',
    disable_move = false,
    shortcut_type = 'letter',
    change_to_vcs_root = true,
    hide = {
        statusline = true,
        tabline = false,
        winbar = false,
    },
    config = {
        default_header = {
            enable = true,
            append = { '', icons.ui.Circle .. ' Make Cool Stuff ' .. icons.ui.Circle },
        },
        packages = { enable = true },
        project = { enable = false, limit = 8 },
        mru = { limit = 1 },
        shortcut = {
            {
                desc = icons.ui.Package .. 'Eat',
                group = '@property',
                action = 'Mason',
                key = 'E',
            },
            {
                desc = icons.ui.Sleep .. 'Sleep',
                group = '@property',
                action = 'Lazy',
                key = 'S',
            },
            {
                desc = icons.documents.OpenFolder .. 'Code',
                group = 'Label',
                action = 'lua require("telescope").extensions.menufacture.find_files()',
                key = 'C',
            },
            {
                desc = icons.ui.Search .. 'Repeat',
                group = 'Label',
                action = 'lua require("telescope").extensions.menufacture.live_grep()',
                key = 'R',
            },
            -- {
            --     desc = icons.ui.Note .. 'Todo',
            --     group = 'Label',
            --     action = 'Tdo',
            --     key = 'd',
            -- },
            -- {
            --     desc = icons.ui.Power,
            --     group = 'Action',
            --     action = 'quit',
            --     key = 'q',
            -- },
        },
        footer = { '','','', icons.diagnostics.Warning .. 'Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live. ' .. icons.diagnostics.Warning },
    },
})

-- Show dashboard when lazy closes wrap
if vim.o.filetype == 'lazy' then
    vim.cmd.close()
    vim.api.nvim_create_autocmd('User', {
        pattern = 'DashboardLoaded',
        callback = function()
            require('lazy').show()
        end,
    })
end
