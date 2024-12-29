local bufferline = require("bufferline")
bufferline.setup({
    options = {
        style_preset = bufferline.style_preset.no_italic,
        color_icons = false,
        indicator = {
            icon = '',
            style = 'none'
        },
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = false,
        hover = {
            enabled = false,
        },
        background = {
            fg = 'none',
            bg = 'none'
        },
	separator_style = { '', '' },  -- No separators
    },
    highlights = {
        fill = {
            bg = 'none',  -- Ensure the fill background is transparent
        },
        background = {
            bg = 'none',  -- Ensure the background is transparent
        },
        buffer_selected = {
            bg = 'none',  -- Ensure the selected buffer background is transparent
        },
        buffer_visible = {
            bg = 'none',  -- Ensure the visible buffer background is transparent
        },
        tab = {
            bg = 'none',  -- Ensure the tab background is transparent
        },
        tab_selected = {
            bg = 'none',  -- Ensure the selected tab background is transparent
        },
        tab_close = {
            bg = 'none',  -- Ensure the tab close button background is transparent
        },
        close_button = {
            bg = 'none',  -- Ensure the close button background is transparent
        },
        close_button_visible = {
            bg = 'none',  -- Ensure the visible close button background is transparent
        },
        close_button_selected = {
            bg = 'none',  -- Ensure the selected close button background is transparent
        },
        separator = {
            bg = 'none',  -- Ensure the separator background is transparent
        },
        separator_selected = {
            bg = 'none',  -- Ensure the selected separator background is transparent
        },
        separator_visible = {
            bg = 'none',  -- Ensure the visible separator background is transparent
        },
        indicator_selected = {
            bg = 'none',  -- Ensure the selected indicator background is transparent
        },
        indicator_visible = {
            bg = 'none',  -- Ensure the visible indicator background is transparent
        },
        duplicate = {
            bg = 'none',  -- Ensure the duplicate buffer background is transparent
        },
        duplicate_selected = {
            bg = 'none',  -- Ensure the selected duplicate buffer background is transparent
        },
        duplicate_visible = {
            bg = 'none',  -- Ensure the visible duplicate buffer background is transparent
        },
        modified = {
            bg = 'none',  -- Ensure the modified buffer background is transparent
        },
        modified_selected = {
            bg = 'none',  -- Ensure the selected modified buffer background is transparent
        },
        modified_visible = {
            bg = 'none',  -- Ensure the visible modified buffer background is transparent
        },
        trunc_marker = {
            bg = 'none',  -- Ensure the truncation marker background is transparent
        },
        pick = {
            bg = 'none',  -- Ensure the pick background is transparent
        },
        pick_selected = {
            bg = 'none',  -- Ensure the selected pick background is transparent
        },
        pick_visible = {
            bg = 'none',  -- Ensure the visible pick background is transparent
        },
        offset_separator = {
            bg = 'none',  -- Ensure the offset separator background is transparent
        },
    },
})


vim.keymap.set('n', '<C-n>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<C-p>', '<Cmd>BufferLineCyclePrev<CR>', {})

-- vscode bindings for consistency
vim.keymap.set('n', 'gt', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', 'gT', '<Cmd>BufferLineCyclePrev<CR>', {})
-- close current buffer
vim.keymap.set('n', '<C-x>', '<Cmd>bdelete<CR>', {})
