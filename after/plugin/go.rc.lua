require('go').setup()

-- Run gofmt + goimport on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

-- set go ident and tab size
vim.api.nvim_exec([[ autocmd FileType go setlocal shiftwidth=2 tabstop=2 ]], false)
