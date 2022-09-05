require('plugins')

vim.cmd("autocmd!")

vim.cmd([[colorscheme gruvbox]])
vim.cmd([[set guicursor=i:block]])
vim.cmd([[set relativenumber]])

local set = vim.opt
local keymap = vim.keymap

vim.scriptencoding = 'utf-8'

set.background = 'light'

set.tabstop = 2
set.autoindent = true
set.smarttab = true
set.expandtab = true
set.cursorline = false
set.termguicolors = true

-- TODO(piotrostr):
-- set the tabstop and shiftwidth based on the filetype using ftplugin

-- go
-- set.tabstop = 8
-- set.shiftwidth = 8

-- tsx
set.tabstop = 2
set.shiftwidth = 2

--navigate without control w, just control
keymap.set('n', '<C-k>', ':wincmd k<CR>')
keymap.set('n', '<C-j>', ':wincmd j<CR>')
keymap.set('n', '<C-h>', ':wincmd h<CR>')
keymap.set('n', '<C-l>', ':wincmd l<CR>')

set.winblend = 0
set.wildoptions = 'pum'
set.pumblend = 5
set.encoding = 'utf-8'
set.fileencoding = 'utf-8'
set.title = true
set.hlsearch = true
set.backup = false
set.showcmd = true
set.cmdheight = 1
set.laststatus = 2
set.expandtab = true
set.scrolloff = 10
set.shell = 'zsh'
set.backupskip = { '/tmp/*', '/private/tmp/*' }
set.inccommand = 'split'
set.ignorecase = true
set.backspace = { 'start', 'eol', 'indent' }
set.path:append { '**' }
set.wildignore:append { '*/node_modules/*' }
set.formatoptions:append { 'r' }

