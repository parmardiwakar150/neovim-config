local custom_gruvbox = require 'lualine.themes.gruvbox'

-- Change the background of lualine_c section for normal mode
custom_gruvbox.normal.c.bg = '#112233'
local function os_icon()
    local icons = {
        unix = '', -- e712
        dos = '', -- e70f
        mac = '' -- e711
    }
    if vim.fn.has('mac') == 1 then
        return icons.mac
    elseif vim.fn.has('win32') == 1 then
        return icons.dos
    else
        return icons.unix
    end
end

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { {
            'filename',
            symbols = {
                modified = '●', -- Text to show when the buffer is modified
            },
        } },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        -- lualine_x = {os_icon},
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
