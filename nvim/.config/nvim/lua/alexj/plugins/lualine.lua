return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local lualine = require('lualine')

        local colors = {
            bg = '#202328',
            fg = '#bbc2cf',
            yellow = '#ECBE7B',
            cyan = '#008080',
            darkblue = '#081633',
            green = '#98be65',
            orange = '#FF8800',
            violet = '#a9a1e1',
            magenta = '#c678dd',
            blue = '#51afef',
            red = '#ec5f67',
        }

        local mode_color = {
            n = colors.green,
            i = colors.blue,
            v = colors.magenta,
            [''] = colors.magenta,
            V = colors.magenta,
            c = colors.yellow,
            t = colors.red,
            R = colors.orange,
            Rv = colors.orange,
            no = colors.fg,
            s = colors.violet,
            S = colors.violet,
            [''] = colors.violet,
            ic = colors.yellow,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
        }

        local conditions = {
            buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
            end,
            buffer_is_file = function()
                return vim.bo.buftype == ''
            end,
            hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end,
            check_git_workspace = function()
                local filepath = vim.fn.expand('%:p:h')
                local gitdir = vim.fn.finddir('.git', filepath .. ';')
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end,
        }

        local searchcount = { 'searchcount', color = { fg = colors.fg, gui = 'bold' } }
        local selectioncount = { 'selectioncount', color = { fg = colors.fg, gui = 'bold' } }
        local progress = { 'progress', color = { fg = colors.fg, gui = 'bold' } }
        local filetype = { 'filetype', color = { fg = colors.blue, gui = 'bold' } }
        local filesize = { 'filesize', color = { fg = colors.fg, gui = 'bold' }, cond = conditions.buffer_not_empty }
        local fileformat = { 'fileformat', icons_enabled = true, color = { fg = colors.white, gui = 'bold' } }

        local filename = {
            'filename',
            cond = conditions.buffer_not_empty and conditions.buffer_is_file,
            color = { fg = colors.magenta, gui = 'bold' },
        }

        local buffers = {
            'buffers',
            use_mode_colors = true,
        }

        local branch = {
            'branch',
            color = { fg = colors.green, gui = 'bold' },
        }

        local diff = {
            'diff',
            diff_color = {
                added = { fg = colors.green },
                modified = { fg = colors.orange },
                removed = { fg = colors.red },
            },
            cond = conditions.hide_in_width,
        }

        local diagnostics = {
            'diagnostics',
            sources = { 'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic' },
            diagnostics_color = {
                color_error = { fg = colors.red },
                color_warn = { fg = colors.yellow },
                color_info = { fg = colors.blue },
                color_hint = { fg = colors.yellow },
            },
        }

        local lsp = {
            function()
                local msg = 'No LSP'
                local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                    return msg
                end
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                    end
                end
                return msg
            end,
            color = { fg = colors.fg, gui = 'bold' },
        }

        local encoding = {
            'o:encoding',
            fmt = string.upper,
            cond = conditions.hide_in_width,
            color = { fg = colors.green, gui = 'bold' },
        }

        local mode_section = {
            function()
                return ''
            end,
            color = function()
                return { fg = mode_color[vim.fn.mode()] }
            end,
            padding = { left = 1, right = 0 },
        }

        lualine.setup({
            options = {
                component_separators = '',
                -- theme = 'tokyonight',
                theme = 'onedark',
                disabled_filetypes = {
                    'dashboard',
                },
            },
            tabline = {
                lualine_a = {},
                lualine_b = { mode_section, buffers },
                lualine_c = {},
                lualine_x = { diff, branch },
                lualine_y = { searchcount, selectioncount },
                lualine_z = {},
            },
            sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { mode_section, 'location', progress, filename },
                lualine_x = { diagnostics, lsp, filetype, filesize, fileformat, encoding },
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
