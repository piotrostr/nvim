vim.opt.termguicolors = true
local bufferline = require("bufferline")
bufferline.setup({
    options = {
	style_preset = bufferline.style_preset.minimal,
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
	}
    },
})
vim.keymap.set('n', '<C-n>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<C-p>', '<Cmd>BufferLineCyclePrev<CR>', {})

-- vscode bindings for consistency
vim.keymap.set('n', 'gt', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', 'gT', '<Cmd>BufferLineCyclePrev<CR>', {})
-- close current buffer
vim.keymap.set('n', '<C-x>', '<Cmd>bdelete<CR>', {})
