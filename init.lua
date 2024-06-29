local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require('plugins')

-- vim.cmd([[set guicursor=i:block]]) -- set cursor to block
vim.cmd([[set relativenumber]])

vim.cmd([[
  augroup user_colors
    autocmd!
    autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
  augroup END
]])

vim.scriptencoding = 'utf-8'

vim.o.background = 'dark' -- or 'light' for light mode
vim.cmd([[colorscheme gruvbox]])

vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })

-- ensure 2 tabs on typescript and tsx
vim.cmd([[autocmd FileType typescript setlocal tabstop=2 shiftwidth=2]])
vim.cmd([[autocmd FileType typescriptreact setlocal tabstop=2 shiftwidth=2]])

--navigate without control w, just control
vim.keymap.set('n', "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set('n', "<C-j>", "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set('n', "<C-k>", "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set('n', "<C-l>", "<cmd>TmuxNavigateRight<cr>")

vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.cursorline = false
vim.opt.signcolumn = "yes"
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.title = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.scrolloff = 10
vim.opt.shell = 'zsh'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.formatoptions:append { 'r' }
