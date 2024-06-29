vim.opt.termguicolors = true
require("bufferline").setup{ }
vim.keymap.set('n', '<C-n>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<C-p>', '<Cmd>BufferLineCyclePrev<CR>', {})

-- vscode bindings for consistency
vim.keymap.set('n', 'gt', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', 'gT', '<Cmd>BufferLineCyclePrev<CR>', {})
-- close current buffer
vim.keymap.set('n', '<C-x>', '<Cmd>bdelete<CR>', {})
