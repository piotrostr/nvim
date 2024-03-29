require('plugins')
require('opts')
require('keys')

vim.cmd("autocmd!")

-- vim.cmd([[set guicursor=i:block]]) -- set cursor to block
vim.cmd([[set relativenumber]])
vim.cmd([[
  augroup user_colors
    autocmd!
    autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
  augroup END
]])

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- ensure that there will be 8 space indents in go files
vim.cmd([[autocmd FileType go setlocal tabstop=8 shiftwidth=8]])

local set = vim.opt
local keymap = vim.keymap

vim.scriptencoding = 'utf-8'

--set.background = 'dark' -- or 'light' for light mode

set.shiftwidth = 2
set.autoindent = true
set.smarttab = true
set.expandtab = true
set.cursorline = false
set.termguicolors = true
set.signcolumn = "yes"


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
