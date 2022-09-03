require('piotrostr.base')
require('piotrostr.highlights')
require('piotrostr.maps')
require('piotrostr.plugins')

vim.cmd([[colorscheme gruvbox]])


local set = vim.opt

set.tabstop = 2
set.autoindent = true
set.smarttab = true
set.expandtab = true
set.cursorline = false

-- go
set.tabstop = 8
set.shiftwidth = 8

-- tsx
set.tabstop = 2
set.shiftwidth = 2
